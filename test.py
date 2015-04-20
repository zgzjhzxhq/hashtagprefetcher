import tweepy

auth = tweepy.OAuthHandler("KPUUViRvSNxfvxAKjaekzkWlA", "mxgYzcFEYp5FN3ne99lYfMvlBglKrzBUi7aSSUx3CHNfe5QMBX")
auth.set_access_token("2151109862-znfROOFGeSMhxSpQaB0In8jh0V1KijU9ytQpOpb","hkYLDR7Qz2dRRhMFoRF3D2soTADxIkXQTj0rBYGhTrQBl")

api = tweepy.API(auth)

i=1
j=0
f = open("GameOfThrones", "w")
for tweet in tweepy.Cursor(api.search, q="#GameOfThrones -RT", rpp="100", show_user=True).items(1000):
    f.write(tweet.text.encode('ascii', errors='backslashreplace'))
    f.write('\n')

#while 1:
#    public_tweets = api.search(q="#GameOfThrones -RT", rpp="100", page=i, show_user=True)
#    for tweet in public_tweets:
#       print j, tweet.text.encode('ascii', errors='backslashreplace')
#       j = j + 1
#    i = i + 1
#    if j > 1000:
#        break

