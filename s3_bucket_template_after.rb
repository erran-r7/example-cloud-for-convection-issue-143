require 'convection'

S3_BUCKET_AFTER = Convection.template do
  # Taken from http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket.html
  s3_bucket 'S3Bucket' do
    # DeletionPolicy
    deletion_policy 'Retain'

    # Properties
    access_control 'Private'
    bucket_name 'Issue137PrivateBucket'
    lifecycle_configuration do
      rule do
        status 'Enabled'
        transition do
          storage_class 'GLACIER'
          transition_date '2016-07-06T23:27:50+00:00'
          transition_in_days 0
        end
      end
    end
    notification_configuration do
      topic_configuration do
        topic 'some-arn'
        event 'SomeEvent'
      end
    end
    versioning_configuration do
      status 'Enabled'
    end

    # Outputs
    with_output 'WebsiteURL', get_att('S3Bucket', 'WebsiteURL') do
      description 'URL for website hosted on S3'
    end

    secure_url_psuedo_property = join('', 'https://', get_att('S3Bucket', 'DomainName'))
    with_output 'S3BucketSecureURL', secure_url_psuedo_property do
      description 'Name of S3 bucket to hold website content'
    end
  end
end
