from collections import defaultdict, Counter

def error_analysis(preds, paradigms):
    def calculate_overlap(p1, p2):
        total = len(p1.forms)
        overlap = len(set(p1.forms).intersection(set(p2.forms)))
        return overlap/total
        

    def confusion_vector(classes, paradigms):
        conf = defaultdict(dict)
        for y, y_hat in classes.items():
            p_true = paradigms[y]
            errors = [x for x in y_hat if x != y]
            c = Counter(errors)
            for c_hat, num in c.items():
                p_pred = paradigms[c_hat]
                overlap = calculate_overlap(p_true, p_pred)
                conf[y][c_hat] = (num, overlap)

        return conf
    
    classes = defaultdict(list)
    for pred in preds:
        class_true = pred[-1]
        class_pred = pred[-2]
        classes[class_true].append(class_pred)

    accuracy = {y: y_hat.count(y)/len(y_hat) for y, y_hat in classes.items()}
    conf = confusion_vector(classes, paradigms)

    text = ""
    for c, acc in sorted(accuracy.items(), key=lambda x: x[1]):
        text += f"== Class {c+1} == \n"
        text += f"Number of examples: {len(classes[c])}\n"
        text += f"Accuracy per class: {acc}\n"
        confusions = sorted(conf[c].items(), key=lambda x: -x[1][0])
        text += "Confused with: \n"
        for c_, (n, overlap) in confusions:
            text += f"Class {c_} {n} times: {overlap}% of overlap\n"
        text += "\n"
    return text







    

    

