# Causal-Inference-for-Loan-Application
The aim of this project is to conduct a study to check following hypothesis: Having a previous loan application causes loan applicants to default less

Does having previous loan application(s) cause people to default less?

- In the banking industry, one of the most important use-cases of analytics is in credit default risk prediction. Most of the time these predictive models work as black boxes because of the sheer number of dependent variables these models use. One important feature that the models used for this task is the credit history of individual applicants. Credit history includes the previous successful application and financial transactions and to a good extent is an indicator of the person’s financial capabilities and responsibilities. We want to study the nature of the relationship that having a previous application has with the probability of default. This variable seems to be easy to explain to the consumer and also the creditor. We would like to investigate whether people having a greater number of loan applications in the past are less likely to default than those with less number of applications or no applications at all.

Initial thoughts on how to address it :

- The ideal experiment would be to divide customers into two groups?: one with a historical loan application and one without loan application history. The two groups should be homogenous on all other explanatory variables such as the education level, gender, spending behavior, job level, family income for members of both groups and the other variables should be the same. Once the loan repayment starts, we can track the monthly installment payments for members of both groups and perform a t-test to check whether there is any difference in the default behavior between the members of the groups.

Plans for data collection:

- For the purpose of the project we will be leveraging the dataset available on Kaggle where Kaggle hosted a competition sponsored by Home Credit to predict the Credit Default of the consumers.- Home credit default dataset ( Kaggle) . Two datasets from this link will be used, dataset for current applications and dataset for previous loan applications. Using the information from these two datasets, the team will check if having previous application really causes fewer defaulting or not and to what extent the 2 set of consumers differ in their default behaviour.
