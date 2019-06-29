# S3 Naked In Public

Example Code to List all S3 buckets, in the default region config, that have 'Public' permissions listed anywhere in the ACL.

There are multiple news articles that continue to come out about **"leaky AWS S3"** ([AWS S3 server leaks data from Fortune 100 companies: Ford, Netflix, TD Bank](https://www.zdnet.com/article/aws-s3-server-leaks-data-from-fortune-100-companies-ford-netflix-td-bank/)) or **"leaving a server unsecured"** and S3 configurations **"without a password"** ([A Washington ISP exposed the 'keys to the kingdom' after leaving a server unsecured](https://techcrunch.com/2018/10/23/washington-isp-pocketinet-server-leak/)).

What do these articles above have in common? This is lingo for AWS S3 buckets configured to have Public access! At least do a basic audit of your S3 buckets and ensure you aren't doing the same, unless it's being done for a purpose because it means *free downloads over here!*

* Some good articles by AWS themselves about securing S3: [How can I secure the files in my Amazon S3 bucket?](https://aws.amazon.com/premiumsupport/knowledge-center/secure-s3-resources/) and [Using Amazon S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html)
* A blog article about several other people creating similar, more robust tools: [How to search for Open Amazon s3 Buckets and their contents](https://medium.com/@grayhatwarfare/how-to-search-for-open-amazon-s3-buckets-and-their-contents-https-buckets-grayhatwarfare-com-577b7b437e01)

> ***NOTE:** These are code examples created back in 2018. They should be tested before use. I'm open to accepting PRs to improve them. This repository was created with minimalist examples that can work as a place to start.*
