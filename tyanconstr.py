item = $pathtopng

func dress(item):
    if "visibility" in item:
        item.visibility = true
    else:
        print("Item hasn't visibility property")

func undress(item):
    if "visibility" in item:
        item.visibility = false
    else:
        print("Item hasn't visibility property")
