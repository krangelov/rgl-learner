from collections import defaultdict, abc
def update(table, new_table):
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
            new_table[k] = '-'
        elif isinstance(v, dict):
            new_table[k] = fill_empty(v)
        else:
            new_table[k] = v
    return new_table

def fix_table(table, param_order, params, fixed_names, num=0):
	new_table = defaultdict(dict)
	param = param_order[num]
	num += 1

	for t, v in table.items():
		if t not in params[param]:
			param_name = fixed_names[param] if param in fixed_names else f"no{param}"
			update(new_table[param_name], fix_table({t: v}, param_order, params, fixed_names, num))
		else:
			if isinstance(v, dict):
				update(new_table[t], fix_table(v, param_order, params, fixed_names, num))
			else:
				new_table[t] = v

	diff = params[param].difference(new_table.keys())

	if diff and (len(new_table.keys()) != 1 or not next(iter(new_table)).startswith("no")):
		for extra_value in diff:
			new_table[extra_value] = {}
	return new_table