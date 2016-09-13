TEE <- function(Sex, Activity, Weight, Height, Age, Units) {
    if (Units == "Imperial") {
        Weight = Weight*0.454
        Height = Height*0.0254
    }
    if (Sex == "Male") {
        if (Activity == "Sedentary") 
            TEE = 864 - 9.72*Age + 14.2*Weight + 503*Height
        else if (Activity == "Low")
            TEE = 864 - 9.72*Age + 1.12*(14.2*Weight + 503*Height)
        else if (Activity == "Moderate")
            TEE = 864 - 9.72*Age + 1.27*(14.2*Weight + 503*Height)
        else
            TEE = 864 - 9.72*Age + 1.54*(14.2*Weight + 503*Height)
    }
    else {
        if (Activity == "Sedentary") 
            TEE = 387 - 7.31*Age + 10.9*Weight + 660.7*Height
        else if (Activity == "Low")
            TEE = 387 - 7.31*Age + 1.14*(10.9*Weight + 660.7*Height)
        else if (Activity == "Moderate")
            TEE = 387 - 7.31*Age + 1.27*(10.9*Weight + 660.7*Height)
        else
            TEE = 387 - 7.31*Age + 1.45*(10.9*Weight + 660.7*Height)
    }
    return(TEE)
}

daily.deficit <- function(Weight, WeightGoal, WeekGoal, Units) {
    if (Units == "Imperial") {
        Weight = Weight*0.454
        WeightGoal = WeightGoal*0.454
    }
    daily.deficit = 7700*(Weight - WeightGoal)/(WeekGoal*7)
    return(daily.deficit)
}

BMI <- function(Weight, Height, Units) {
    BMI = Weight/Height^2
    if (Units == "Imperial") {
        BMI = BMI*703
    }
    return(BMI)
}

BMI.goal <- function(Weight, Height, Units) {
    BMI.goal = Weight/Height^2
    if (Units == "Imperial") {
        BMI.goal = BMI.goal*703
    }
    return(BMI.goal)
}