# S3 Naked In Public

![S3NakedInPublic Banner](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/s3nakedinpublic-banner.jpg)

Example Code to List all S3 buckets, in the default region config, that have URI Grant access to ..global/AllUsers permissions listed in the ACL.

> ***NOTE:** These are code examples created back in 2018. They should be tested before use. I'm open to accepting PRs to improve them. This repository was created with minimalist examples that can work as a place to start.*

There are multiple news articles that continue to come out about **"leaky AWS S3"** ([AWS S3 server leaks data from Fortune 100 companies: Ford, Netflix, TD Bank](https://www.zdnet.com/article/aws-s3-server-leaks-data-from-fortune-100-companies-ford-netflix-td-bank/)) or **"leaving a server unsecured"** and S3 configurations **"without a password"** ([A Washington ISP exposed the 'keys to the kingdom' after leaving a server unsecured](https://techcrunch.com/2018/10/23/washington-isp-pocketinet-server-leak/)).

[Apple](https://medium.com/@jonathanbouman/how-i-hacked-apple-com-unrestricted-file-upload-bcda047e27e3) (which had a URI Grant access to ..global/AllUsers as my example code looks for), along with many other companies, have messed up with this before.

What do these articles above have in common? This is lingo for AWS S3 buckets configured to have Public access! At least do a basic audit of your S3 buckets and ensure you aren't doing the same, unless it's being done for a purpose because it means *free downloads over here!*

## Some S3 Basic Examples

Let's say we have a bucket, and it has a Public access ACL granted to it.

### Bash Shell Script Example

Running one of my examples, the shell script (which is wrapped around [AWSCLI](https://aws.amazon.com/cli/)):

```
./s3nakedinpublic.sh
```

This example script will output any buckets with Public (specifically, global/AllUsers) in the ACL.

```
./s3nakedinpublic.sh
uhohthisisbad
```

### Walking Through The AWS Management Console

In this case, `uhohthisisbad` is an S3 bucket that it found. What does that look like from the AWS console? For one, you can sort by "Public" buckets:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/before-blocking-public.png "S3 Naked In Public")

The dead giveaway is the "Public" icon:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/public-icon.png "S3 Naked In Public")

Within the ACL permissions of the bucket, we would see something like this:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/public-access-acl.png "S3 Public Access ACL")

How do you fix this? AWS has made this as easy as possible. Here it can be changed on the bucket itself:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/aws-s3-bucket-specific-block-public.gif "S3 Block Public Access to Bucket")

You can also do this with less running around, and in bulk:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/aws-s3-bulk-bucket-block-public.gif "S3 Bulk Block Public Access to Buckets")

You can also do this account wide, but you'd have to be absolutely certain that this won't be breaking functionality where this has been done intentionally for serving files for download or other purposes:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/aws-s3-account-wide-bucket-block-public.gif "S3 Block Public Access to Buckets Account Wide")

Now the big "Public" label is no longer on our bucket:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/after-blocking-public.png "S3 Clothed In Public")

And the ACL would now look something like this:

![alt text](https://github.com/ScriptAutomate/s3nakedinpublic/blob/master/imgs/public-access-acl-blocked.png "S3 Public Access ACL Blocked")

## Best Practice

There should be some kind of monitoring implemented in an account in order to alert in the event that a bucket has modifications where itself or contents gain public access, or if new buckets are made with public permissions.

Some resources to look at:

* [Cloud Custodian](https://github.com/cloud-custodian/cloud-custodian)
* [Security Monkey](https://github.com/Netflix/security_monkey)
* [AWS Security Hub](https://aws.amazon.com/security-hub/)

## Additional Resources

* A robust-looking tool for S3 inspection that looks beyond the simple ACL lookup s3nakedinpublic examples use, which may be the best place to look next (though it hasn't been updated in over a year, keep in mind): https://github.com/kromtech/s3-inspector
* A repo hosting a report of AWS S3 "leaks" that have happened over time: https://github.com/nagwww/s3-leaks
* Rapid7 Blog Article from 2013: [There's a Hole in 1,951 Amazon S3 Buckets](https://blog.rapid7.com/2013/03/27/open-s3-buckets/) (You can be certain the number is much higher now...)
* Some good articles by AWS themselves about securing S3: [How can I secure the files in my Amazon S3 bucket?](https://aws.amazon.com/premiumsupport/knowledge-center/secure-s3-resources/) and [Using Amazon S3 Block Public Access](https://docs.aws.amazon.com/AmazonS3/latest/dev/access-control-block-public-access.html)

### Scan and Dump Tool Examples

* https://github.com/sa7mon/S3Scanner
* https://github.com/jordanpotti/AWSBucketDump
