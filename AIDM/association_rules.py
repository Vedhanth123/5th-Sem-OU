from mlxtend.preprocessing import TransactionEncoder
from mlxtend.frequent_patters import apriori, association_rules

transactions=[
['bread','jam','butter'],
['bread','milk','eggs'],
['bread','milk','butter','jam'],
['milk','butter','eggs'],
['bread','milk','eggs']
]

te = TransactionEncoder()
te_ary = te.fit(transactions)
df = pd.DataFrame(te_ary, columns=te.columns_)

fi = apriori(df, min_support=0.4, use_colnames= True)
rules = association_rules(fi, metric = 'confidence', min_threshold=0.7)

print(fi)
print(rules)
