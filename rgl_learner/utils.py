from collections import defaultdict, abc

def get_param_order(pos, params):
    param_order = []
    for tag, (_, param, pos_tags) in params.items():
        if param not in param_order and pos in pos_tags:
            param_order.append(param)
    return param_order

def nested_key_exists(d, keys):
    if keys and d:
        if isinstance(d.get(keys[0]), str):
            return True
        else:
            return nested_key_exists(d.get(keys[0]), keys[1:])
    return False


def update(table, new_table):
    if isinstance(table, dict):
        for k, v in new_table.items():
            if isinstance(v, abc.Mapping):
                table[k] = update(table.get(k, {}), v)
            else:
                table[k] = v
    return table


def fill_empty(table):
    new_table = {}
    for k, v in table.items():
        if v == {}:
            new_table[k] = "-"
        elif isinstance(v, dict):
            new_table[k] = fill_empty(v)
        else:
            new_table[k] = v
    return new_table



def fix_table(table, param_order, params, fixed_names, num=0, exclude_list=[]):
    new_table = defaultdict(dict)
    if num >= len(param_order):
        raise ValueError(f"This tag is not supported: {next(iter(table))}")
    param = param_order[num]
    values = params[param]
    num += 1


    for t, v in table.items():
        if not t or t in values:
            if isinstance(v, dict):
                update(
                    new_table[t],
                    fix_table(v, param_order, params, fixed_names, num, exclude_list),
                )
            else:
                new_table[t] = v
        elif param in exclude_list:
            while (
                param_order[num] in exclude_list and t not in params[param_order[num]]
            ):
                num += 1
            if t in params[param_order[num]]:
                if isinstance(v, dict):
                    update(
                            new_table[t],
                            fix_table(
                                v,
                                param_order,
                                params,
                                fixed_names,
                                num+1,
                                exclude_list,
                            ),
                        )
                else:
                    new_table[t] = v
            else:
                param_name = (
                        fixed_names[param_order[num]]
                        if param_order[num] in fixed_names
                        else f"no{param_order[num]}"
                    )
                update(
                        new_table[param_name],
                        fix_table(
                            {t: v},
                            param_order,
                            params,
                            fixed_names,
                            num+1,
                            exclude_list,
                        ),
                    )
        else:
            param_name = fixed_names[param] if param in fixed_names else f"no{param}"
            update(
                new_table[param_name],
                fix_table({t: v}, param_order, params, fixed_names, num, exclude_list),
            )

    diff = params[param].difference(new_table.keys())

    if (
        diff
        and diff != params[param]
        and (
            len(new_table.keys()) != 1
            or not (
                next(iter(new_table)).startswith("no")
                or next(iter(new_table)) in fixed_names.values()
            )
        )
    ):
        for extra_value in diff:
            new_table[extra_value] = {}
    return new_table

def escape(s):
    s2 = ""
    for c in s:
        if c == "'":
            s2 += "\\'"
        elif c == "\\":
            s2 += "\\\\"
        else:
            s2 += c
    return "'"+s2+"'"
