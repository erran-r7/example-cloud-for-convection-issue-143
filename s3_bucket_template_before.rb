require 'convection'

S3_BUCKET_BEFORE = Convection.template do
  # Taken from http://docs.aws.amazon.com/AWSCloudFormation/latest/UserGuide/aws-properties-s3-bucket.html
  s3_bucket 'S3Bucket' do
    # DeletionPolicy
    deletion_policy 'Retain'

    # Properties
    access_control 'Private'
    bucket_name 'Issue137PrivateBucket'
    versioning_configuration 'Status' => 'Enabled'

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
