source("./CalcCal.R")

library(shiny)
shinyServer(function(input, output) {
    output$input <- renderText({
        
        BMI = BMI(Weight = input$Weight, Height = input$Height, 
                Units = input$Units)
        BMI.goal = BMI.goal(Weight = input$WeightGoal, Height = input$Height, 
                Units = input$Units)
                                                                                        
        if (input$Units == "Metric") {
            unit.weight = "kg"
            unit.height = "m"
        } else {
            unit.weight = "lbs"
            unit.height = "inches"
        }
        
        if (BMI.goal <18) 
            BMI.goal.info = ", which is <span style='color: red'>under weight"
        else if (BMI.goal <= 25) 
            BMI.goal.info = ", which is <span style='color: green'>normal weight"
        else 
            BMI.goal.info = ""
        
        paste0("You told me you are a ", "<strong>", input$Age, " year old ", 
               input$Sex, "</strong>", " with ", "<strong>", input$Activity, 
               " Activity. ", "</strong>", "You weigh ","<strong>", input$Weight, 
               " ", unit.weight, "</strong>", " and are ", "<strong>", 
               input$Height, " ", unit.height, "</strong>", " tall, and you want 
               to lose ", "<strong>", input$Weight - input$WeightGoal, " ", 
               unit.weight, "</strong>", " over ", "<strong>", input$WeekGoal, 
               " weeks.", "</strong>","<br>","<br>",
               "Your current ", "<strong>","BMI is ",round(BMI,0),"</strong>",
               " and your goal ","<strong>","BMI is ", round(BMI.goal,0), 
               BMI.goal.info, ".","</strong>","<br>","<br>")
    })

    output$goal <- renderText({
        
        TEE = TEE(Sex = input$Sex, Activity = input$Activity, 
                Weight = input$Weight, Height = input$Height, 
                Age = input$Age, Units = input$Units)
        
        daily.deficit = daily.deficit(Weight = input$Weight, 
                WeightGoal = input$WeightGoal, WeekGoal = input$WeekGoal, 
                Units = input$Units)

        paste0("Your estimated average daily energy expenditure is approximately ", 
               "<strong>",round(TEE,0),"</strong>", " calories.", "<br>","<br>",
               "You will need to limit your average daily calorie intake to ",
               "<strong>", round(TEE - daily.deficit,0),"</strong>",
               " for ", "<strong>",input$WeekGoal, " weeks","</strong>",
               " to achieve your goal.", "<br>","<br>")
    })
    
    output$result <- renderText({
        
        TEE = TEE(Sex = input$Sex, Activity = input$Activity, 
                Weight = input$Weight, Height = input$Height, Age = input$Age, 
                Units = input$Units)
        
        daily.deficit = daily.deficit(Weight = input$Weight, 
                WeightGoal = input$WeightGoal, WeekGoal = input$WeekGoal, 
                Units = input$Units)
        
        BMI = BMI(Weight = input$Weight, Height = input$Height, Units = input$Units)
        
        if (daily.deficit/TEE < 0.25) 
            weightloss.info = "<span style='color: green'>
                This is a reasonable weight loss pace."
        else if (daily.deficit/TEE < 0.40) 
            weightloss.info = "<span style='color: orange'>
                This is an aggressive weight loss pace. Consider a longer weight 
                loss time frame or your activity level."
        else 
            weightloss.info = "<span style='color: red'>This is an unrealistic 
                weight loss pace. You will probably need to increase your weight 
                loss time frame or your activity level."
        
        paste0("<strong>",weightloss.info,"</strong>")
    })
})
