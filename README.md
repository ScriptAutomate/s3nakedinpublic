# S3 Naked In Public

Example Code to List all S3 buckets, in the default region config, that have 'Public' permissions listed anywhere in the ACL.

There are multiple news articles that continue to come out about **"leaky AWS S3"** ([AWS S3 server leaks data from Fortune 100 companies: Ford, Netflix, TD Bank](https://www.zdnet.com/article/aws-s3-server-leaks-data-from-fortune-100-companies-ford-netflix-td-bank/)) or **"leaving a server unsecured"** and S3 configurations **"without a password"** ([A Washington ISP exposed the 'keys to the kingdom' after leaving a server unsecured](https://techcrunch.com/2018/10/23/washington-isp-pocketinet-server-leak/)).

[Apple](https://medium.com/@jonathanbouman/how-i-hacked-apple-com-unrestricted-file-upload-bcda047e27e3) (which had a URI Grant access to ..global/AllUsers as my example code looks for), along with many other companies, have messed up with this before.

What do these articles above have in common? This is lingo for AWS S3 buckets configured to have Public access! At least do a basic audit of your S3 buckets and ensure you aren't doing the same, unless it's being done for a purpose because it means *free downloads over here!*

## Resources

* A robust-looking tool for S3 inspection that looks beyond the simple ACL lookup s3nakedinpublic examples use, which may be the best place to look next (though it hasn't been updated in over a year, keep in mind): https://github.com/kromtech/s3-inspector
* A repo hosting a report of AWS S3 "leaks" that have happened over time: https://github.com/nagwww/s3-leaks
* Rapid7 Blog Article from 2013: [There's a Hole in 1,951 Amazon S3 Buckets](https://blog.rapid7.com/2013/03/27/open-s3-buckets/) (You can be certain the number is much higher now...)
* Some good articles by AWS themselves about securing S3: [How can I secure the files in my Amazon S3 bucket?](https://aws.amazon.com/premiumsupport/knowledge-center/secure-s3-resources/) and [Using Amazon S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html)

### Scan and Dump Tool Examples

* https://github.com/sa7mon/S3Scanner
* https://github.com/jordanpotti/AWSBucketDump

> ***NOTE:** These are code examples created back in 2018. They should be tested before use. I'm open to accepting PRs to improve them. This repository was created with minimalist examples that can work as a place to start.*
