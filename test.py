import tweepy

auth = tweepy.OAuthHandler("ARaQIIKxF3GV7T2UNt7Wm3xuG", "omEkk45RACnrP3GL2TWUyrLpuMp4MlXy7bvIHCiU3hnIhV5abZ")
auth.set_access_token("64687094-XedIf5AUHTsDpWY5i3lBs5x033KyArmvlpt9GkTFP","QQK7v0h63DCPJjHJPMwzoG2okBVuhkuGgnxNyruTpOSgu")

api = tweepy.API(auth)

i=1
j=0
f = open("Badgers", "w")
for tweet in tweepy.Cursor(api.search, q="#Badgers -RT", rpp="100", show_user=True).items(1000):
    f.write(str(j))
    f.write('\t')
    f.write(tweet.text.encode('ascii', errors='backslashreplace'))
    f.write('\n')
    j = j+1

#while 1:
#    public_tweets = api.search(q="#GameOfThrones -RT", rpp="100", page=i, show_user=True)
#    for tweet in public_tweets:
#       print j, tweet.text.encode('ascii', errors='backslashreplace')
#       j = j + 1
#    i = i + 1
#    if j > 1000:
#        break

