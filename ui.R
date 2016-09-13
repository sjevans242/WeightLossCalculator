library(shiny)
shinyUI(pageWithSidebar(
    headerPanel("Weight Loss Calculator"),
    sidebarPanel(
        
        h3("Tell me about yourself"),
        
        radioButtons(
            inputId  = "Sex",
            label    = "Sex:",
            choices  = c("Male", "Female"),
            selected = "Female"
        ),
       
        numericInput(
            inputId = "Age",
            label = strong("Your age (years):"),
            value = 35
        ),
        
        radioButtons(
            inputId  = "Units",
            label    = "Units:",
            choices  = c("Metric", "Imperial"),
            selected = "Imperial"
        ),
        
        numericInput(
            inputId = "Weight",
            label = strong("Your weight (kgs or lbs)"),
            value = 150
        ), 
        
        numericInput(
            inputId = "Height",
            label = strong("Your height (meters or inches):"),
            value = 65,
            step = 0.1
        ),
        
        radioButtons(
            inputId  = "Activity",
            label    = "Activity Label:",
            choices  = c("Sedentary", "Low",
                          "Moderate", "High"),
            selected = "Sedentary"
        ),
        
        h3("Tell me about your goals"),
        
        numericInput(
            inputId = "WeightGoal",
            label = strong("What is your goal weight?"),
            value = 140
        ),

        numericInput(
            inputId = "WeekGoal",
            label = strong("How many weeks do you want to take to achieve your goal?"),
            value = 12
        )),
    
    mainPanel(
        helpText("This calculator will help you understand your daily energy needs and the calorie deficit
                you will need to achieve for your weight loss goal. Change the inputs to 
                reflect your current status and goal, making sure you pay attention to whether or not you 
                have selected Metric or Imperial units. The numbers in bold below will change as you adjust 
                your selections."),
        helpText("For activity levels, consider Sedentary activity as getting no planned exercise and having
                a sedentary job. Low activity comes from planned light exercise 1-2 times per week or
                having a job that causes you to move around some during the day. Moderate activity comes
                from moderate planned exercise 3-5 times per week or a job that has you on your feet most
                of the day. High activity corresponds to vigourous planned exercise 5 or more days per
                week or a very physically demanding job."),
        uiOutput("input"),
        uiOutput("goal"),
        uiOutput("result")
    )
    )
)