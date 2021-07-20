# Exploring the GLobal Terrorism Data

## Overview
&emsp;Despite various strategies performed by Security and Intelligence agencies throughout the world, terrorist activities are still a millennium challenge. Recently, data-mining techniques have evolved to allow the identification of patterns and associations in criminals. 
 
&emsp;GTD has recently released its new version that includes all data about terrorist attacks till 2019, including the year 1993(as a separate file). The [GTD codebook][1] provides detailed documentation about the data and its inclusion criteria. I have used SQLite to subset the data and then perform various cleaning and preprocessing using programming languages such as Python and R programming. I then used Tableau, a data visualization tool, to join the subsets and explore the data.

&emsp;After working on this project, one can dive deeper into each feature and explore its relations. We can perform various statistical analyses to understand, discover and predict the upcoming terrorist attacks.

##  Literature Survey
&emsp;Fatalities(number of deaths) and Casualties(number of deaths and injuries) are the key issues I dealt with in this project. Correlation factors that influence terrorist attacks by ISSST, Country-level terrorism trends, Identification of subgroups to prevent mass casualties are some of the research topics that I used. Most of these focus on different statistical methods and machine learning approaches to detect terrorist activities in depth.

&emsp;The background report 2019 provided by the START was my starting point to understand the GTD as a whole. It showcases an intuitive way of understanding the GTI score. Various regional trends and trends on terrorist groups are studied.

## Procedure
### Global Terrorism Database
&emsp;The GTD defines a terrorist attack as the threatened or actual use of illegal force and violence by a non-state actor to attain a political, economic, religious, or social goal through fear, coercion, or intimidation. To consider an incident for inclusion in the GTD, all three of the following attributes must be present:
- The incident must be intentional
- The act must entail some level of violence   
- The perpetrators of the incidents must be sub-national actors  

&emsp;In addition, at least two of the following three criteria must be present
- Criterion 1: The act must want to attain a political, economic, religious, or social goal.
- Criterion 2: There must be evidence of an intention to coerce, intimidate, or convey some other message to a larger audience
- Criterion 3: The action must be outside the context of legitimate warfare activities

Some things to be noted while working 
- Geo-political boundaries of many countries have changed over time.
- The location coordinates(latitudes and longitudes) are WGS1984 standards)
- The success of a terrorist attack is defined according to the tangible effects of the attack but not judged in terms of the larger goals of the perpetrators

&emsp;Check out my take on finding GTI score here: [Calculating Global Terrorism Index][13]

### 3-Phase Model

Dividing the project into segments and smaller, it aims to 
- Find a metric to quantify terrorism as a whole. 
- Compare consecutive years by casualties level.
- Uncover hidden patterns in frequency count and textual data.

&emsp;In the first part, we explore the geospatial trends with GTI scores in our minds. We will also find various global KPIs that can be derived. Then in the next part, we will differentiate terrorism between two consecutive years. We will also study the top most influential terrorist groups over the years. The last part tries to unearth the hidden patterns of the textual data and correlation between categories.

### Statistical Techniques 

&emsp;Used Correspondence Analysis to find out the correlation between the categorical variables and fatality. A new feature of factors very-low, low, high, very-high is created by the number of deaths. For each variable in the study, I made a frequency table of fatality levels. Then the distance measure is calculated to obtain the final contributions. After that, implemented Singular Value Decomposition to deduce two principal components that explain more than 90% of the variance.

&emsp;Iterative topic modeling is performed with the textual data to understand the term frequency and document the frequency of the top words in each year.

&emsp;You can find out the detailed explanation in [Exploring the Global Terrosism Data: The bakend][12]

## Conclusion & Future Scope
&emsp;In summary, we have derived a potential metric to quantify terrorism, observed the similarities and dissimilarities between consecutive years, unleashed patterns through different statistical methods.

&emsp;This project could be a starting point to understand the in-detailed correlations between various features in GTD. You can study latent class growth modeling to find chronological patterns, clustering based on different methodologies to groups the events, analyzing killing ranges, understanding the origin and activity of terrorist organizations.

&emsp;Also, note that we have been working with only the GTD database throughout the project. Work on various other terrorism databases such as RAND, MIPT Terrorism Knowledge Base, Worldwide incidents Tracking Systems, Tocsearch, etc.


## References 
- [Global Terrorism Index 2020: Measuring the impact of terrorism by Institute for Economics & Peace][2]
- [Global Terrorism Overview 2019 by Erin Miller, START Background Report, University of Maryland][3]
- [A Method for Analyzing Terrorist Attacks by Ibrahim Toure; Aryya Gangopadhyay, IEEE Xplore][4]
- [Identifcation of subgroups of terror attacks with shared characteristics for the purpose of preventing mass-casualty attacks: a data-mining approach by Gonen Singer and Maya Golan][5]
- [Study on correlation factors that influence terrorist attack fatalities using Global Terrorism Database by Science Direct][6]
- [Transnational Terrorism Hot Spots: Identification and Impact Evaluation by Quan Li][7]
- [Killing Range: Explaining Lethality Variance within a Terrorist Organization by Sage Journals][8]
- [Mining Causal Topics in Text Data: Iterative Topic Modeling with Time Series Feedback in ACM Digital Library][9]
- [ICPVTR Webinar on Terrorism & Challenges of Counter Terrorism in the Next Decade by Suzanne Raine][10]

[1]: https://www.start.umd.edu/gtd/downloads/Codebook.pdf
[2]: https://www.visionofhumanity.org/wp-content/uploads/2020/11/GTI-2020-web-1.pdf
[3]: https://www.start.umd.edu/pubs/START_GTD_GlobalTerrorismOverview2019_July2020.pdf
[4]: https://ieeexplore.ieee.org/document/6459927
[5]: https://crimesciencejournal.biomedcentral.com/track/pdf/10.1186/s40163-019-0109-9.pdf
[6]: https://www.sciencedirect.com/science/article/pii/S1877705814017962
[7]: https://www.researchgate.net/publication/228742211_Transnational_Terrorism_Hot_Spots_Identification_and_Impact_Evaluation
[8]: https://journals.sagepub.com/doi/full/10.1177/0022002713508927
[9]: https://dl.acm.org/doi/10.1145/2505515.2505612#pill-authors__contentcon
[10]: https://youtu.be/Ie8eZaV6-0E

[11]: https://www.start.umd.edu/gtd/access/

[12]: https://rpubs.com/SuhruthYambakam/GTD-EDA-backend
[13]: https://nbviewer.jupyter.org/github/SuhruthY/GRIP_Task3/blob/master/Code%20Samples/GTI_scores.ipynb
