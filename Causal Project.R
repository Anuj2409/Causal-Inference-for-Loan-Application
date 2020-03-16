# Loading library and reading data
  library(MatchIt)
#  library(sensitivitymw)
  library(dplyr)
  
  data <- read.csv('C:/Users/Anuj/Desktop/Spring Term/Causal Inference/Project/Master_Data_with_filtering_updated.csv')
  prev_app <- read.csv('C:/Users/Anuj/Desktop/Spring Term/Causal Inference/Project/previous_application.csv')
  prev_app_count <- prev_app %>% group_by(SK_ID_CURR) %>%  summarize(number_prev_app = n())

  # Feature Selection
  variables <- c( 'SK_ID_CURR',
                  'TARGET',                                                     
                  'CNT_CHILDREN',                                               
                  'AMT_INCOME_TOTAL',                                           
                  'AMT_CREDIT_x',                                               
                  'AMT_ANNUITY_x',                                              
                  'AMT_GOODS_PRICE_x',                                          
                  'DAYS_BIRTH',                                                 
                  'DAYS_EMPLOYED',                                              
                  'CNT_FAM_MEMBERS',                                            
                  'REGION_RATING_CLIENT_W_CITY',                                
                  'EXT_SOURCE_2',                                               
                  'EXT_SOURCE_3',                                               
                  'FLAG_DOCUMENT_2',                                            
                  'FLAG_DOCUMENT_3',                                            
                  'FLAG_DOCUMENT_4',                                            
                  'FLAG_DOCUMENT_5',                                            
                  'FLAG_DOCUMENT_6',                                            
                  'FLAG_DOCUMENT_7',                                            
                  'FLAG_DOCUMENT_8',                                            
                  'FLAG_DOCUMENT_9',                                            
                  'FLAG_DOCUMENT_10',                                           
                  'FLAG_DOCUMENT_11',                                           
                  'FLAG_DOCUMENT_12',                                           
                  'FLAG_DOCUMENT_13',                                           
                  'FLAG_DOCUMENT_14',                                           
                  'FLAG_DOCUMENT_15',                                           
                  'FLAG_DOCUMENT_16',                                           
                  'FLAG_DOCUMENT_17',                                           
                  'FLAG_DOCUMENT_18',                                           
                  'FLAG_DOCUMENT_19',                                           
                  'FLAG_DOCUMENT_20',                                           
                  'FLAG_DOCUMENT_21',                                           
                  'NAME_CONTRACT_TYPE_Cash.loans',                              
                  'NAME_CONTRACT_TYPE_Revolving.loans',                         
                  'CODE_GENDER_F',                                              
                  'CODE_GENDER_M',                                              
                  'CODE_GENDER_XNA',                                            
                  'FLAG_OWN_CAR_N',                                             
                  'FLAG_OWN_CAR_Y',                                             
                  'FLAG_OWN_REALTY_N',                                          
                  'FLAG_OWN_REALTY_Y',                                          
                  'NAME_TYPE_SUITE_x_Children',                                 
                  'NAME_TYPE_SUITE_x_Family',                                   
                  'NAME_TYPE_SUITE_x_Group.of.people',                          
                  'NAME_TYPE_SUITE_x_Other_A',                                  
                  'NAME_TYPE_SUITE_x_Other_B',                                  
                  'NAME_TYPE_SUITE_x_Spouse..partner',                          
                  'NAME_TYPE_SUITE_x_Unaccompanied',                            
                  'NAME_INCOME_TYPE_Businessman',                               
                  'NAME_INCOME_TYPE_Commercial.associate',                      
                  'NAME_INCOME_TYPE_Maternity.leave',                           
                  'NAME_INCOME_TYPE_Pensioner',                                 
                  'NAME_INCOME_TYPE_State.servant',                             
                  'NAME_INCOME_TYPE_Student',                                   
                  'NAME_INCOME_TYPE_Unemployed',                                
                  'NAME_INCOME_TYPE_Working',                                   
                  'NAME_EDUCATION_TYPE_Academic.degree',                        
                  'NAME_EDUCATION_TYPE_Higher.education',                       
                  'NAME_EDUCATION_TYPE_Incomplete.higher',                      
                  'NAME_EDUCATION_TYPE_Lower.secondary',                        
                  'NAME_EDUCATION_TYPE_Secondary...secondary.special',          
                  'NAME_FAMILY_STATUS_Civil.marriage',                          
                  'NAME_FAMILY_STATUS_Married',                                 
                  'NAME_FAMILY_STATUS_Separated',                               
                  'NAME_FAMILY_STATUS_Single...not.married',                    
                  'NAME_FAMILY_STATUS_Unknown',                                 
                  'NAME_FAMILY_STATUS_Widow',                                   
                  'NAME_HOUSING_TYPE_Co.op.apartment',                          
                  'NAME_HOUSING_TYPE_House...apartment',                        
                  'NAME_HOUSING_TYPE_Municipal.apartment',                      
                  'NAME_HOUSING_TYPE_Office.apartment',                         
                  'NAME_HOUSING_TYPE_Rented.apartment',                         
                  'NAME_HOUSING_TYPE_With.parents',                             
                  'ORGANIZATION_TYPE_Advertising',                              
                  'ORGANIZATION_TYPE_Agriculture',                              
                  'ORGANIZATION_TYPE_Bank',                                     
                  'ORGANIZATION_TYPE_Business.Entity.Type.1',                   
                  'ORGANIZATION_TYPE_Business.Entity.Type.2',                   
                  'ORGANIZATION_TYPE_Business.Entity.Type.3',                   
                  'ORGANIZATION_TYPE_Cleaning',                                 
                  'ORGANIZATION_TYPE_Construction',                             
                  'ORGANIZATION_TYPE_Culture',                                  
                  'ORGANIZATION_TYPE_Electricity',                              
                  'ORGANIZATION_TYPE_Emergency',                                
                  'ORGANIZATION_TYPE_Government',                               
                  'ORGANIZATION_TYPE_Hotel',                                    
                  'ORGANIZATION_TYPE_Housing',                                  
                  'ORGANIZATION_TYPE_Industry..type.1',                         
                  'ORGANIZATION_TYPE_Industry..type.10',                        
                  'ORGANIZATION_TYPE_Industry..type.11',                        
                  'ORGANIZATION_TYPE_Industry..type.12',                        
                  'ORGANIZATION_TYPE_Industry..type.13',                        
                  'ORGANIZATION_TYPE_Industry..type.2',                         
                  'ORGANIZATION_TYPE_Industry..type.3',                         
                  'ORGANIZATION_TYPE_Industry..type.4',                         
                  'ORGANIZATION_TYPE_Industry..type.5',                         
                  'ORGANIZATION_TYPE_Industry..type.6',                         
                  'ORGANIZATION_TYPE_Industry..type.7',                         
                  'ORGANIZATION_TYPE_Industry..type.8',                         
                  'ORGANIZATION_TYPE_Industry..type.9',                         
                  'ORGANIZATION_TYPE_Insurance',                                
                  'ORGANIZATION_TYPE_Kindergarten',                             
                  'ORGANIZATION_TYPE_Legal.Services',                           
                  'ORGANIZATION_TYPE_Medicine',                                 
                  'ORGANIZATION_TYPE_Military',                                 
                  'ORGANIZATION_TYPE_Mobile',                                   
                  'ORGANIZATION_TYPE_Other',                                    
                  'ORGANIZATION_TYPE_Police',                                   
                  'ORGANIZATION_TYPE_Postal',                                   
                  'ORGANIZATION_TYPE_Realtor',                                  
                  'ORGANIZATION_TYPE_Religion',                                 
                  'ORGANIZATION_TYPE_Restaurant',                               
                  'ORGANIZATION_TYPE_School',                                   
                  'ORGANIZATION_TYPE_Security',                                 
                  'ORGANIZATION_TYPE_Security.Ministries',                      
                  'ORGANIZATION_TYPE_Self.employed',                            
                  'ORGANIZATION_TYPE_Services',                                 
                  'ORGANIZATION_TYPE_Telecom',                                  
                  'ORGANIZATION_TYPE_Trade..type.1',                            
                  'ORGANIZATION_TYPE_Trade..type.2',                            
                  'ORGANIZATION_TYPE_Trade..type.3',                            
                  'ORGANIZATION_TYPE_Trade..type.4',                            
                  'ORGANIZATION_TYPE_Trade..type.5',                            
                  'ORGANIZATION_TYPE_Trade..type.6',                            
                  'ORGANIZATION_TYPE_Trade..type.7',                            
                  'ORGANIZATION_TYPE_Transport..type.1',                        
                  'ORGANIZATION_TYPE_Transport..type.2',                        
                  'ORGANIZATION_TYPE_Transport..type.3',                        
                  'ORGANIZATION_TYPE_Transport..type.4',                        
                  'ORGANIZATION_TYPE_University',                               
                  'ORGANIZATION_TYPE_XNA',                                      
                  'NAME_CASH_LOAN_PURPOSE_Building.a.house.or.an.annex',        
                  'NAME_CASH_LOAN_PURPOSE_Business.development',                
                  'NAME_CASH_LOAN_PURPOSE_Buying.a.garage',                     
                  'NAME_CASH_LOAN_PURPOSE_Buying.a.holiday.home...land',        
                  'NAME_CASH_LOAN_PURPOSE_Buying.a.home',                       
                  'NAME_CASH_LOAN_PURPOSE_Buying.a.new.car',                    
                  'NAME_CASH_LOAN_PURPOSE_Buying.a.used.car',                   
                  'NAME_CASH_LOAN_PURPOSE_Car.repairs',                         
                  'NAME_CASH_LOAN_PURPOSE_Education',                           
                  'NAME_CASH_LOAN_PURPOSE_Everyday.expenses',                   
                  'NAME_CASH_LOAN_PURPOSE_Furniture',                           
                  'NAME_CASH_LOAN_PURPOSE_Gasification...water.supply',         
                  'NAME_CASH_LOAN_PURPOSE_Hobby',                               
                  'NAME_CASH_LOAN_PURPOSE_Journey',                             
                  'NAME_CASH_LOAN_PURPOSE_Medicine',                            
                  'NAME_CASH_LOAN_PURPOSE_Money.for.a.third.person',            
                  'NAME_CASH_LOAN_PURPOSE_Other',                               
                  'NAME_CASH_LOAN_PURPOSE_Payments.on.other.loans',             
                  'NAME_CASH_LOAN_PURPOSE_Purchase.of.electronic.equipment',    
                  'NAME_CASH_LOAN_PURPOSE_Refusal.to.name.the.goal',            
                  'NAME_CASH_LOAN_PURPOSE_Repairs',                             
                  'NAME_CASH_LOAN_PURPOSE_Urgent.needs',                        
                  'NAME_CASH_LOAN_PURPOSE_Wedding...gift...holiday',            
                  'NAME_CASH_LOAN_PURPOSE_XAP')
  
data1 <- merge(data[,variables], prev_app_count, by = 'SK_ID_CURR', all.x = T)
data1$number_prev_app <- ifelse(is.na(data1$number_prev_app), 0,data1$number_prev_app)
data1$prev <- ifelse(data1$number_prev_app == 0, 0, 1)


# PSM
data2 <- data1[complete.cases(data1),-c(1,2)]

match.out <- NULL
match.out <-  matchit( prev ~  CNT_CHILDREN                                            
                       + AMT_INCOME_TOTAL                                           
                       + AMT_CREDIT_x                                               
                       + AMT_ANNUITY_x                                              
                       + AMT_GOODS_PRICE_x                                          
                       + DAYS_BIRTH                                                 
                       + DAYS_EMPLOYED                                              
                       + CNT_FAM_MEMBERS                                            
                       + REGION_RATING_CLIENT_W_CITY                                
                       + EXT_SOURCE_2                                               
                       + EXT_SOURCE_3                                               
                       + FLAG_DOCUMENT_2                                            
                       + FLAG_DOCUMENT_3                                            
                       + FLAG_DOCUMENT_4                                            
                       + FLAG_DOCUMENT_5                                            
                       + FLAG_DOCUMENT_6                                            
                       + FLAG_DOCUMENT_7                                            
                       + FLAG_DOCUMENT_8                                            
                       + FLAG_DOCUMENT_9                                            
                       + FLAG_DOCUMENT_10                                           
                       + FLAG_DOCUMENT_11                                           
                       + FLAG_DOCUMENT_12                                           
                       + FLAG_DOCUMENT_13                                           
                       + FLAG_DOCUMENT_14                                           
                       + FLAG_DOCUMENT_15                                           
                       + FLAG_DOCUMENT_16                                           
                       + FLAG_DOCUMENT_17                                           
                       + FLAG_DOCUMENT_18                                           
                       + FLAG_DOCUMENT_19                                           
                       + FLAG_DOCUMENT_20                                           
                       + FLAG_DOCUMENT_21                                           
                       + NAME_CONTRACT_TYPE_Cash.loans                              
                       + NAME_CONTRACT_TYPE_Revolving.loans                         
                       + CODE_GENDER_F                                              
                       + CODE_GENDER_M                                              
                       + CODE_GENDER_XNA                                            
                       + FLAG_OWN_CAR_N                                             
                       + FLAG_OWN_CAR_Y                                             
                       + FLAG_OWN_REALTY_N                                          
                       + FLAG_OWN_REALTY_Y                                          
                       + NAME_TYPE_SUITE_x_Children                                 
                       + NAME_TYPE_SUITE_x_Family                                   
                       + NAME_TYPE_SUITE_x_Group.of.people                          
                       + NAME_TYPE_SUITE_x_Other_A                                  
                       + NAME_TYPE_SUITE_x_Other_B                                  
                       + NAME_TYPE_SUITE_x_Spouse..partner                          
                       + NAME_TYPE_SUITE_x_Unaccompanied                            
                       + NAME_INCOME_TYPE_Businessman                               
                       + NAME_INCOME_TYPE_Commercial.associate                      
                       + NAME_INCOME_TYPE_Maternity.leave                           
                       + NAME_INCOME_TYPE_Pensioner                                 
                       + NAME_INCOME_TYPE_State.servant                             
                       + NAME_INCOME_TYPE_Student                                   
                       + NAME_INCOME_TYPE_Unemployed                                
                       + NAME_INCOME_TYPE_Working                                   
                       + NAME_EDUCATION_TYPE_Academic.degree                        
                       + NAME_EDUCATION_TYPE_Higher.education                       
                       + NAME_EDUCATION_TYPE_Incomplete.higher                      
                       + NAME_EDUCATION_TYPE_Lower.secondary                        
                       + NAME_EDUCATION_TYPE_Secondary...secondary.special          
                       + NAME_FAMILY_STATUS_Civil.marriage                          
                       + NAME_FAMILY_STATUS_Married                                 
                       + NAME_FAMILY_STATUS_Separated                               
                       + NAME_FAMILY_STATUS_Single...not.married                    
                       + NAME_FAMILY_STATUS_Unknown                                 
                       + NAME_FAMILY_STATUS_Widow                                   
                       + NAME_HOUSING_TYPE_Co.op.apartment                          
                       + NAME_HOUSING_TYPE_House...apartment                        
                       + NAME_HOUSING_TYPE_Municipal.apartment                      
                       + NAME_HOUSING_TYPE_Office.apartment                         
                       + NAME_HOUSING_TYPE_Rented.apartment                         
                       + NAME_HOUSING_TYPE_With.parents                             
                       + ORGANIZATION_TYPE_Advertising                              
                       + ORGANIZATION_TYPE_Agriculture                              
                       + ORGANIZATION_TYPE_Bank                                     
                       + ORGANIZATION_TYPE_Business.Entity.Type.1                   
                       + ORGANIZATION_TYPE_Business.Entity.Type.2                   
                       + ORGANIZATION_TYPE_Business.Entity.Type.3                   
                       + ORGANIZATION_TYPE_Cleaning                                 
                       + ORGANIZATION_TYPE_Construction                             
                       + ORGANIZATION_TYPE_Culture                                  
                       + ORGANIZATION_TYPE_Electricity                              
                       + ORGANIZATION_TYPE_Emergency                                
                       + ORGANIZATION_TYPE_Government                               
                       + ORGANIZATION_TYPE_Hotel                                    
                       + ORGANIZATION_TYPE_Housing                                  
                       + ORGANIZATION_TYPE_Industry..type.1                         
                       + ORGANIZATION_TYPE_Industry..type.10                        
                       + ORGANIZATION_TYPE_Industry..type.11                        
                       + ORGANIZATION_TYPE_Industry..type.12                        
                       + ORGANIZATION_TYPE_Industry..type.13                        
                       + ORGANIZATION_TYPE_Industry..type.2                         
                       + ORGANIZATION_TYPE_Industry..type.3                         
                       + ORGANIZATION_TYPE_Industry..type.4                         
                       + ORGANIZATION_TYPE_Industry..type.5                         
                       + ORGANIZATION_TYPE_Industry..type.6                         
                       + ORGANIZATION_TYPE_Industry..type.7                         
                       + ORGANIZATION_TYPE_Industry..type.8                         
                       + ORGANIZATION_TYPE_Industry..type.9                         
                       + ORGANIZATION_TYPE_Insurance                                
                       + ORGANIZATION_TYPE_Kindergarten                             
                       + ORGANIZATION_TYPE_Legal.Services                           
                       + ORGANIZATION_TYPE_Medicine                                 
                       + ORGANIZATION_TYPE_Military                                 
                       + ORGANIZATION_TYPE_Mobile                                   
                       + ORGANIZATION_TYPE_Other                                    
                       + ORGANIZATION_TYPE_Police                                   
                       + ORGANIZATION_TYPE_Postal                                   
                       + ORGANIZATION_TYPE_Realtor                                  
                       + ORGANIZATION_TYPE_Religion                                 
                       + ORGANIZATION_TYPE_Restaurant                               
                       + ORGANIZATION_TYPE_School                                   
                       + ORGANIZATION_TYPE_Security                                 
                       + ORGANIZATION_TYPE_Security.Ministries                      
                       + ORGANIZATION_TYPE_Self.employed                            
                       + ORGANIZATION_TYPE_Services                                 
                       + ORGANIZATION_TYPE_Telecom                                  
                       + ORGANIZATION_TYPE_Trade..type.1                            
                       + ORGANIZATION_TYPE_Trade..type.2                            
                       + ORGANIZATION_TYPE_Trade..type.3                            
                       + ORGANIZATION_TYPE_Trade..type.4                            
                       + ORGANIZATION_TYPE_Trade..type.5                            
                       + ORGANIZATION_TYPE_Trade..type.6                            
                       + ORGANIZATION_TYPE_Trade..type.7                            
                       + ORGANIZATION_TYPE_Transport..type.1                        
                       + ORGANIZATION_TYPE_Transport..type.2                        
                       + ORGANIZATION_TYPE_Transport..type.3                        
                       + ORGANIZATION_TYPE_Transport..type.4                        
                       + ORGANIZATION_TYPE_University                               
                       + ORGANIZATION_TYPE_XNA                                      
                       + NAME_CASH_LOAN_PURPOSE_Building.a.house.or.an.annex        
                       + NAME_CASH_LOAN_PURPOSE_Business.development                
                       + NAME_CASH_LOAN_PURPOSE_Buying.a.garage                     
                       + NAME_CASH_LOAN_PURPOSE_Buying.a.holiday.home...land        
                       + NAME_CASH_LOAN_PURPOSE_Buying.a.home                       
                       + NAME_CASH_LOAN_PURPOSE_Buying.a.new.car                    
                       + NAME_CASH_LOAN_PURPOSE_Buying.a.used.car                   
                       + NAME_CASH_LOAN_PURPOSE_Car.repairs                         
                       + NAME_CASH_LOAN_PURPOSE_Education                           
                       + NAME_CASH_LOAN_PURPOSE_Everyday.expenses                   
                       + NAME_CASH_LOAN_PURPOSE_Furniture                           
                       + NAME_CASH_LOAN_PURPOSE_Gasification...water.supply         
                       + NAME_CASH_LOAN_PURPOSE_Hobby                               
                       + NAME_CASH_LOAN_PURPOSE_Journey                             
                       + NAME_CASH_LOAN_PURPOSE_Medicine                            
                       + NAME_CASH_LOAN_PURPOSE_Money.for.a.third.person            
                       + NAME_CASH_LOAN_PURPOSE_Other                               
                       + NAME_CASH_LOAN_PURPOSE_Payments.on.other.loans             
                       + NAME_CASH_LOAN_PURPOSE_Purchase.of.electronic.equipment    
                       + NAME_CASH_LOAN_PURPOSE_Refusal.to.name.the.goal            
                       + NAME_CASH_LOAN_PURPOSE_Repairs                             
                       + NAME_CASH_LOAN_PURPOSE_Urgent.needs                        
                       + NAME_CASH_LOAN_PURPOSE_Wedding...gift...holiday            
                       + NAME_CASH_LOAN_PURPOSE_XAP,
                       data = data2 , distance = "logit" , replace = T,ratio = 1, method = "nearest" , caliper = 0.5)


matched.pair.df <- NULL           
matched.pair.df <- cbind(data2[row.names(match.out$match.matrix),], data2[match.out$match.matrix,])

write.csv(matched.pair.df, 'C:/Users/Anuj/Desktop/Spring Term/Causal Inference/Project/Matched Pairs_point5.csv')

only.matched.df <- NULL
only.matched.df<- na.omit(matched.pair.df)
write.csv(only.matched.df, 'C:/Users/Anuj/Desktop/Spring Term/Causal Inference/Project/Only Matched Pairs_point5.csv')


# Reading the saved dataset
data3 <- read.csv('C:/Users/Anuj/Desktop/Spring Term/Causal Inference/Project/Only Matched Pairs_point5.csv')
data3_test <- data3[,2:157]
data3_control <- data3[,158:313]
colnames(data3_control) <- colnames(data3_test)
data4 <- rbind(data3_test,data3_control)

data5 <- merge(data4, data1, all.x = T, by = variables[-c(1,2)])

# Regression
model <- glm(TARGET ~ prev.y , data = data5, family = 'binomial')
summary(model) # Not significant

#Sample size testing
t.test(data5$TARGET ~data5$prev.y) 
power.t.test(delta =  -0.06897270+0.06063763  , sig.level = 0.05, power = 0.8)

# # Endogenity Check
# 1. Selection Bias
# 2. Simultaneity Bias
# summary(lm(TARGET[1:nrow(data1)-1] ~ prev[2:nrow(data1)], data = data1))
# summary(lm(prev[1:nrow(data1)-1]~TARGET[2:nrow(data1)], data = data1))
# 
# 3. Omitted Variable bias
# 4. Measurement Error Bias
# 
# # Sensitivity Check
# 1. Rosenbaum test - To quantify the hidden bias due to unmeasured confounders
# 
# senmw(data, gamma = 1, method = “t”)$pval

# Plotting 
my_theme <- theme(panel.background = element_rect(fill='white',colour='black',size = 0.4),
                  panel.grid.major = element_line(colour = "gray",linetype ='dashed'),
                  panel.grid.minor = element_line(colour='gray', size =0.2,linetype ='dashed'),
                  axis.text.x = element_text(face="bold",  size=8, angle=90, hjust = 1),
                  plot.title = element_text(face = "bold",size = 12,hjust = 0.5))
ps_model = glm(TARGET ~ prev, data = data1, family = 'binomial')
data1$ps = ps_model$fitted.values
ggplot(data = data1, aes(x = ps, color = as.factor(TARGET))) + geom_density(size = 2) + my_theme

## Treatment Control Dataset
ps_model1 = glm(TARGET ~ prev.y, data = data5, family = 'binomial')
data5$ps = ps_model1$fitted.values
ggplot(data = data5, aes(x = ps, color = as.factor(TARGET))) + geom_density(size = 1) + my_theme + xlab('Propensity Score') + ggtitle('Propensity Distribution of matched pairs')
