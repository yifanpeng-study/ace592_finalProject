## High Frequency Decentralized Cryptocurrency Price Analysis Using Sentiment Score of Bitcoin
### ACE592 SAE final project - 2021 Spring
### Chang Cai (ACE), Yuqing Han (ECON) and Yifan Peng (ACE)

**Description**: This repository contains all the scripts that are necessary to replicate the analysis. All data used for this analysis are public accessible. The replication files are sufficient for fully replicating our work.

### Brief guide to scripts inside: "code"
- **`1_batchScraping.ipynb`**:  Extract historical tweets via Twitter API based on search terms such as "Bitcoin" and store the output in a csv file. 
- **`2_sentiment_score_processing.ipynb`**: Initial processing of the tweets and calculation of the sentiment score using cleaned text. It returns the data frame of minute-level sentiment.
- **`3_yahoo_api_data.ipynb`**: Download cryptocurrency prices and stock market index via [Yahoo Finance API](https://finance.yahoo.com/quotes/API,Documentation/view/v1/?guccounter=1). It generates four csv files.
- **`4_merge_data.ipynb`**: Match the sentiment with financial datasets. It outputs a data frame that is used for descriptive analysis and time-series analysis.
- **`5_EDA.ipynb`**: Generate Figure 1-2 in the paper.
- **`6_VAR_log.do**:  Conduct all the time-series analysis on the merged data, including ADF test, VAR and impulse response analysis. It also generate Table 1-2 and Figure 3-4 in the paper.
