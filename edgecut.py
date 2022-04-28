def addOutline(imageArray):
    from statistics import mean
    newAr = imageArray
    newAr.flags.writeable = True
    balance = 250
    for i0 in range(1,len(newAr)):
        for i in range(1,len(newAr[i0])):
            if mean(newAr[i0][i][:3]) > balance and mean(newAr[i0][i-1][:3]) < balance:
                newAr[i0][i-1][:3] = 40
            if mean(newAr[i0][i][:3]) < balance and mean(newAr[i0][i-1][:3]) > balance:
                newAr[i0][i][:3] = 40
            if mean(newAr[i0][i][:3]) < balance and mean(newAr[i0-1][i][:3]) > balance:
                newAr[i0][i][:3] = 40
            if mean(newAr[i0][i][:3]) < balance and mean(newAr[i0+1][i][:3]) > balance:
                newAr[i0][i][:3] = 40

    return newAr

