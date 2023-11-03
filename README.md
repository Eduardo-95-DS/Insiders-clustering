# Insiders-clustering

## High Value Customer Identification
![oie_jHgcQJlEWL5L](https://github.com/Soturno95/Insiders-clustering/assets/95311171/995e5c97-7370-466d-ad32-83e8c923b479)

# **1. Business problem**
StarProducts is a business to consumer e-commerce. In order to better understand the customer base, create better customer experience and increase revenue through reaching more effectively every segment of clients, the company decided to create a loyalty program, focused on the creation of a **Insiders** group; a segmentation of the most valuable clients. 

Here's the output needed:

- Indication of people to be part of the loyalty program "INSIDERS".

- Report with answers to the following questions:

  - Who are eligible to participate in the Insiders program?

  - How many customers will be part of the group?

  - What are the main characteristics of these customers?

  - What is the percentage of revenue contribution from Insiders?

  - What is this group's billing expectation for the coming months?

  - What are the conditions for a person to be eligible for Insiders?

  - What are the conditions for a person to be removed from Insiders?

  - What is the guarantee that the Insiders program is better than the rest of the base?

  - What actions can the marketing team take to increase revenue?

A dashboard gathering the most important infos about all the clients and the deployment to productionof a machine learning algorithm were also required. 

# **2. Business assumptions**
- Products with prices below 0.04 were deemed unimportant to the revenue analysis , thus removed.
- Only quantities  of products above 0 were considered useful.
- Stock codes with words and letters were considered potentially troublesome for the clustering analysis, thus removed.
- The feature 'description' was removed because the names of the products aren't important.
- In the 'country' feature, 'european community' and 'unspecified' were considered potentially troublesome for the clustering analysis, thus removed.
- Customers '12346', '16446' ,'21497, '21498' and '21499' were deemed as 'bad users' and thus removed since some of the features associated with them probably contained insertion errors and/or informations that didn't make since due to the yearly nature of the dataset. 

This filtering only removed 0.01% of the total dataset, which contained 541909 rows of a yearly sample, ranging from 29-11-2016 to 07-12-2017.

# **3. Solution strategy**

- Step 01. Data description
- Step 02. Feature engineering
- Step 03. Data filtering
- Step 04. Exploratory data analysis
- Step 05. Data preparation
- Step 06. Feature selection
- Step 07. Machine learning modelling
- Step 08. Hyperparameter fine tunning
- Step 09. Convert model performance to business values
- Step 10. Deploy model to production

# **4. Top 3 data insights**

## Hypothesis 1:
### Insiders have a purchase volume (products) above 10% of total purchases
**True**: Insider's product purchase volume is 38.28% of total purchases
![download (1)](https://github.com/Soturno95/Insiders-clustering/assets/95311171/dc2e8d69-fe96-4231-a076-9f34147b9acf)

## Hypothesis 2:  
### Insiders have an average number of returns below the average for the total customer base
**False**: In average insiders returns are 7x higher
![download (2)](https://github.com/Soturno95/Insiders-clustering/assets/95311171/5eb1ee1c-0476-42ed-83ea-e749770c39bb)

## Hypothesis 3:
### The GMV of insiders is concentrated in the 3rd quartile
**False**: The insiders revenue is concentrated in the 1° quartile
![download](https://github.com/Soturno95/Insiders-clustering/assets/95311171/ed986d33-a07e-4159-a343-377707164a64)

# **5. Machine learning model applied**

The algorithms used were Random forest regressor (RFR), K-means, Gaussian mixture model (GMM) and Hierarchical clustering (HC). Random forest regressor was used to create a embedding space, in which the dataset was more organized in a higher dimensionality space, allowing the clusterization algorithms (k-means, gmm and hc) to perform better.

On top of that, dimensionality reductor algorithms such as UMAP, t-SNE and PCA were used after data preparation and after the RFR (in the embedding space) (before the  algorithms) in order to further improve performance.

Silhouette method/score and visualization were the metrics used.

# **6. Machine learning model performance**

The K (n° of clusters) chosen was 10, which was a balanced number between a decent silhouette score and a manageable n° of clusters for the business/marketing teams.    
Of the dimensonality reductors, UMAP was the most efficient, thus the only shown below.    

Silhouette scores with only data preparation (standardization of features with Min Max Scaler):    
**K-means -** 0.421276   
**GMM -** -0.181430   
**HC -** 0.374576   
![Untitled](https://github.com/Soturno95/Insiders-clustering/assets/95311171/04ddfa48-82c8-4d9f-830f-16c4924ce848)   

Silhouette scores with data preparation (standardization of features with Min Max Scaler) and UMAP:   
**K-means -** 0.513254   
**GMM -** 0.465497   
**HC -** 0.474117   
![Untitled1](https://github.com/Soturno95/Insiders-clustering/assets/95311171/ea93be1b-581e-4007-824b-67e2e2f43fed)   

Silhouette scores with the RFR embedding space and UMAP with tuned parameters:      
**K-means -** 0.645201   
**GMM -** 0.645221   
HC - 0.645021    
![Untitled2](https://github.com/Soturno95/Insiders-clustering/assets/95311171/0699b854-c55e-4a95-946a-35e7bf268b8a)     


All three algorithms had a very similar silhouette score; looking at the silhouette visualizations below (per cluster), the HC algorithm had a slight higher score in the Insiders cluster (the last silhouette from top top bottom), therefore it was the chosen algorithm.   

## - K-means
![Untitled1](https://github.com/Soturno95/Insiders-clustering/assets/95311171/6f340531-4e65-42e0-8688-b75ad58e1702)

## - GMM 
![Untitled22](https://github.com/Soturno95/Insiders-clustering/assets/95311171/d0709bec-ca93-46a2-891e-9ad09f978bfd)

## - HC 
![Untitled3](https://github.com/Soturno95/Insiders-clustering/assets/95311171/47dc157f-fe53-4b00-aa03-e7b094a3a10a)

# **7. Business results**

## **7.1 Business questions**

- Who are eligible to participate in the Insiders program?

For the full list of Insiders, see the insiders.csv or the dashboard.

- How many customers will be part of the group?

550

- What are the main characteristics of these customers?
 
Number of customers : 550, 9.66 % of all the customers
Average revenue : $ 10,280.14
Average recency : 44
Average number of products purchased : 367
Average purchase frequency : 0.21/day

- What is the percentage of revenue contribution from Insiders?
56.39%

- What is this group's billing expectation for the coming months?
For this questions

- What are the conditions for a person to be eligible for Insiders?

- What are the conditions for a person to be removed from Insiders?

- What is the guarantee that the Insiders program is better than the rest of the base?

- What actions can the marketing team take to increase revenue?






