# Data_Analytics__ClimateChange_Case_Study

## Pitch
The goal of this analysis is to identify trends or key indicators of climate change by first looking at the overall warming of the planet across various countries, over the past 300 years. Periods of greater increase should be prevalent within the data, where further investigation into those periods can be done to determine cause and correlation.

## Ask

> Guiding questions

- What topic are you exploring?
    - The topic of this analysis is on global temperature increases.
- What is the problem you are trying to solve?
    - There isn't a particular problem trying to be solved in this case study. The aim is to identify trends or particular moments in time where global temperatures began to rise at an increasing rate. Once identified, those time periods can be further researched with the goal of determining the root causes, and possibly, if they can be mitigated.

- What metrics will you use to measure your data to achieve your objective?
    - The primary metrics for this analysis will be the average temperature for a given year by country as well as the average temperature uncertainty for that year.
    - The data was initially formatted as Months, but it does not need to be that granular. For this analysis, it has been condensed to a Year, taking the average monthly temperatures and averaging those over the year.

- Who are the stakeholders?
    - 
- Who is your audience?
    -
- How can your insights help your client make decisions?
    - 
> Key tasks

- Identify the business task **

- Determine key stakeholders

- Choose a dataset **

- Establish metrics **

> Deliverable

- A clear statement of the business task you have selected to investigate **

## Prepare

> Guiding questions 

- Where is your data located?
    - The data is stored in OneDrive.

- How is the data organized? 
    - The data is organized into the following columns: Date, AvgTemperature, AvgTemperatureUncertainty, City, Country, Latitude and Longitude. For the purpose of this analysis, only the Date, AvgTemperature, AvgTemperatureUncertainty and Country will be used.

- Are there issues with bias or credibility in this data? Does your data ROCCC?
    - The data is from reputable sources, so there is no issue with credibility.

- How are you addressing licensing, privacy, security, and accessibility?
    - The dataset was acquired from Kaggle, and is open to use. The data itself is stored in a secured cloud location and locally, therefore there is some redundancy.
 
- How did you verify the data's integrity?
    - Once the file was acquired, I matched the Hash to that of the one on the website. Additionally, the data was checked prior to analysis.
- How does it help you answer your question?

- Are there any problems with the data?
    - The data itself was fine, however, some columns had to be manipulated, such as dt.
> Key Tasks

- Download data and store it appropriately. **

- Identify how it's organized. **

- Sort and filter the data. **

- Determine the credibility of the data. **

> Deliverable 

- A description of all data sources used **

## Process

> Guiding questions 

- What tools are you choosing and why?
    - After initially using Excel for some preliminary analysis, I'll primarily be using R for the rest of the analysis, visualizations and presentation. I might utilize Tableau for visualizations as well.

- Have you ensured your data's integrity?
    - After acquiring the dataset from the Kaggle website, the integrity of the data appears to be intact as the size of the dataset is the same as its source. Comparing the Hash values can determine that integrity is intact as well.
    - The formatting of the data is consistent, and although one column was modified to be analyzed more easily, it does not jeapordize the integrity of it.
    - No data has been removed or added to the dataset; therefore, the integrity is intact.
    
- What steps have you taken to ensure that your data is clean?
    - I first inspected the CSV file, filtering the data, running a pivot table and sorting it to try and
    identify any errors or discrepancies from the outset. No initial manipulation of the data was necessary in Excel, however, I was able to discern preliminary trends in the data to focus on during primary analysis.
    - I then imported the data into Visual Studio Code (R) and started checking for NA's, missing values and extreme outliers that might indicate errors, biases, etc.
    - Some columns were then renamed for readability.
    - The dt (date) column was modified to be represented as Years, and not Months.

- How can you verify that your data is clean and ready to analyze?
    - I double-checked the data for NA's, extreme outliers that would skew the results and values that are 0 that are likely errors.

- Have you documented your cleaning process to review and share those results?
    - The cleaning process has been documented in a prior question.

> Key Tasks

- Check the data for errors. **
- Choose your tools. **
- Transform the data so you can work with it effectively. **
- Document the cleaning process. **

> Deliverable 

- Documentation of any cleaning or manipulation of data **

## Analyze

> Guiding Questions

- How should you organize your data to perform analysis on it?
    - The original data is stored separate from the modified CSV.
    - The majority of the code relating to analysis exists within an .R file.

- Has your data been properly formatted?
    - The data appears to be properly formatted, however, some values had to be reformatted for analysis,
    such as combining the dates into years from 12 months of data into a years worth of data.

- What surprises did you discover in the data?
    - 

- What trends or relationships did you find in the data?
    -

- How will these insights help answer your business questions?
    - 

> Key tasks 

- Aggregate your data so it’s useful and accessible. **

- Organize and format your data. **

- Perform calculations. **

- Document your calculations to keep track of your analysis steps. **

- Identify trends and relationships. **

> Deliverable 

- A summary of your analysis **

## Share

> Guiding questions

- Were you able to answer the business question?
    - 

- What story does your data tell?
    - 

- How do your findings relate to your original question?
    - 

- Who is your audience? What is the best way to communicate with them?
    - 

- Can data visualization help you share your findings?
    - 

- Is your presentation accessible to your audience?
    - The visualizations make the findings more presentable to any group as it makes the connections more clear.

> Key tasks

- Determine the best way to share your findings. **

- Create effective data visualizations. **

- Present your findings. **

- Ensure your work is accessible. **

> Deliverable

- Supporting visualizations and key findings **

## Act

> Guiding questions

- What is your final conclusion based on your analysis?
    - 
- How could your team and business apply your insights?
    -
- What next steps would you or your stakeholders take based on your findings?
    - 
- Is there additional data you could use to expand on your findings?
    - 

> Key tasks

- Create your portfolio. **

- Add your case study. **

- Practice presenting your case study to a friend or family member. **

> Deliverable

- Your top high-level insights based on your analysis Based on what you discover, a list of additional deliverables you think would be helpful to include for further exploration