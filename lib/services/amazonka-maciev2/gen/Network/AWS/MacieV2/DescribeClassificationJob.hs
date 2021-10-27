{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-binds #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MacieV2.DescribeClassificationJob
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves the status and settings for a classification job.
module Network.AWS.MacieV2.DescribeClassificationJob
  ( -- * Creating a Request
    DescribeClassificationJob (..),
    newDescribeClassificationJob,

    -- * Request Lenses
    describeClassificationJob_jobId,

    -- * Destructuring the Response
    DescribeClassificationJobResponse (..),
    newDescribeClassificationJobResponse,

    -- * Response Lenses
    describeClassificationJobResponse_lastRunErrorStatus,
    describeClassificationJobResponse_jobType,
    describeClassificationJobResponse_initialRun,
    describeClassificationJobResponse_jobId,
    describeClassificationJobResponse_clientToken,
    describeClassificationJobResponse_jobArn,
    describeClassificationJobResponse_s3JobDefinition,
    describeClassificationJobResponse_createdAt,
    describeClassificationJobResponse_userPausedDetails,
    describeClassificationJobResponse_samplingPercentage,
    describeClassificationJobResponse_managedDataIdentifierSelector,
    describeClassificationJobResponse_lastRunTime,
    describeClassificationJobResponse_customDataIdentifierIds,
    describeClassificationJobResponse_name,
    describeClassificationJobResponse_statistics,
    describeClassificationJobResponse_managedDataIdentifierIds,
    describeClassificationJobResponse_jobStatus,
    describeClassificationJobResponse_description,
    describeClassificationJobResponse_tags,
    describeClassificationJobResponse_scheduleFrequency,
    describeClassificationJobResponse_httpStatus,
  )
where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import Network.AWS.MacieV2.Types
import qualified Network.AWS.Prelude as Prelude
import qualified Network.AWS.Request as Request
import qualified Network.AWS.Response as Response

-- | /See:/ 'newDescribeClassificationJob' smart constructor.
data DescribeClassificationJob = DescribeClassificationJob'
  { -- | The unique identifier for the classification job.
    jobId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DescribeClassificationJob' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'jobId', 'describeClassificationJob_jobId' - The unique identifier for the classification job.
newDescribeClassificationJob ::
  -- | 'jobId'
  Prelude.Text ->
  DescribeClassificationJob
newDescribeClassificationJob pJobId_ =
  DescribeClassificationJob' {jobId = pJobId_}

-- | The unique identifier for the classification job.
describeClassificationJob_jobId :: Lens.Lens' DescribeClassificationJob Prelude.Text
describeClassificationJob_jobId = Lens.lens (\DescribeClassificationJob' {jobId} -> jobId) (\s@DescribeClassificationJob' {} a -> s {jobId = a} :: DescribeClassificationJob)

instance Core.AWSRequest DescribeClassificationJob where
  type
    AWSResponse DescribeClassificationJob =
      DescribeClassificationJobResponse
  request = Request.get defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          DescribeClassificationJobResponse'
            Prelude.<$> (x Core..?> "lastRunErrorStatus")
            Prelude.<*> (x Core..?> "jobType")
            Prelude.<*> (x Core..?> "initialRun")
            Prelude.<*> (x Core..?> "jobId")
            Prelude.<*> (x Core..?> "clientToken")
            Prelude.<*> (x Core..?> "jobArn")
            Prelude.<*> (x Core..?> "s3JobDefinition")
            Prelude.<*> (x Core..?> "createdAt")
            Prelude.<*> (x Core..?> "userPausedDetails")
            Prelude.<*> (x Core..?> "samplingPercentage")
            Prelude.<*> (x Core..?> "managedDataIdentifierSelector")
            Prelude.<*> (x Core..?> "lastRunTime")
            Prelude.<*> ( x Core..?> "customDataIdentifierIds"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (x Core..?> "name")
            Prelude.<*> (x Core..?> "statistics")
            Prelude.<*> ( x Core..?> "managedDataIdentifierIds"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (x Core..?> "jobStatus")
            Prelude.<*> (x Core..?> "description")
            Prelude.<*> (x Core..?> "tags" Core..!@ Prelude.mempty)
            Prelude.<*> (x Core..?> "scheduleFrequency")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable DescribeClassificationJob

instance Prelude.NFData DescribeClassificationJob

instance Core.ToHeaders DescribeClassificationJob where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToPath DescribeClassificationJob where
  toPath DescribeClassificationJob' {..} =
    Prelude.mconcat ["/jobs/", Core.toBS jobId]

instance Core.ToQuery DescribeClassificationJob where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newDescribeClassificationJobResponse' smart constructor.
data DescribeClassificationJobResponse = DescribeClassificationJobResponse'
  { -- | Specifies whether any account- or bucket-level access errors occurred
    -- when the job ran. For a recurring job, this value indicates the error
    -- status of the job\'s most recent run.
    lastRunErrorStatus :: Prelude.Maybe LastRunErrorStatus,
    -- | The schedule for running the job. Possible values are:
    --
    -- -   ONE_TIME - The job runs only once.
    --
    -- -   SCHEDULED - The job runs on a daily, weekly, or monthly basis. The
    --     scheduleFrequency property indicates the recurrence pattern for the
    --     job.
    jobType :: Prelude.Maybe JobType,
    -- | For a recurring job, specifies whether you configured the job to analyze
    -- all existing, eligible objects immediately after the job was created
    -- (true). If you configured the job to analyze only those objects that
    -- were created or changed after the job was created and before the job\'s
    -- first scheduled run, this value is false. This value is also false for a
    -- one-time job.
    initialRun :: Prelude.Maybe Prelude.Bool,
    -- | The unique identifier for the job.
    jobId :: Prelude.Maybe Prelude.Text,
    -- | The token that was provided to ensure the idempotency of the request to
    -- create the job.
    clientToken :: Prelude.Maybe Prelude.Text,
    -- | The Amazon Resource Name (ARN) of the job.
    jobArn :: Prelude.Maybe Prelude.Text,
    -- | The S3 buckets that contain the objects to analyze, and the scope of
    -- that analysis.
    s3JobDefinition :: Prelude.Maybe S3JobDefinition,
    -- | The date and time, in UTC and extended ISO 8601 format, when the job was
    -- created.
    createdAt :: Prelude.Maybe Core.POSIX,
    -- | If the current status of the job is USER_PAUSED, specifies when the job
    -- was paused and when the job or job run will expire and be cancelled if
    -- it isn\'t resumed. This value is present only if the value for jobStatus
    -- is USER_PAUSED.
    userPausedDetails :: Prelude.Maybe UserPausedDetails,
    -- | The sampling depth, as a percentage, that determines the percentage of
    -- eligible objects that the job analyzes.
    samplingPercentage :: Prelude.Maybe Prelude.Int,
    -- | The selection type that determines which managed data identifiers the
    -- job uses to analyze data. Possible values are:
    --
    -- -   ALL - Use all the managed data identifiers that Amazon Macie
    --     provides.
    --
    -- -   EXCLUDE - Use all the managed data identifiers that Macie provides
    --     except the managed data identifiers specified by the
    --     managedDataIdentifierIds property.
    --
    -- -   INCLUDE - Use only the managed data identifiers specified by the
    --     managedDataIdentifierIds property.
    --
    -- -   NONE - Don\'t use any managed data identifiers.
    --
    -- If this value is null, the job uses all managed data identifiers. If
    -- this value is null, ALL, or EXCLUDE for a recurring job, the job also
    -- uses new managed data identifiers as they are released.
    managedDataIdentifierSelector :: Prelude.Maybe ManagedDataIdentifierSelector,
    -- | The date and time, in UTC and extended ISO 8601 format, when the job
    -- started. If the job is a recurring job, this value indicates when the
    -- most recent run started.
    lastRunTime :: Prelude.Maybe Core.POSIX,
    -- | An array of unique identifiers, one for each custom data identifier that
    -- the job uses to analyze data. This value is null if the job uses only
    -- managed data identifiers to analyze data.
    customDataIdentifierIds :: Prelude.Maybe [Prelude.Text],
    -- | The custom name of the job.
    name :: Prelude.Maybe Prelude.Text,
    -- | The number of times that the job has run and processing statistics for
    -- the job\'s current run.
    statistics :: Prelude.Maybe Statistics,
    -- | An array of unique identifiers, one for each managed data identifier
    -- that the job is explicitly configured to include (use) or exclude (not
    -- use) when it analyzes data. Inclusion or exclusion depends on the
    -- managed data identifier selection type specified for the job
    -- (managedDataIdentifierSelector). This value is null if the job\'s
    -- managed data identifier selection type is ALL or the job uses only
    -- custom data identifiers (customDataIdentifierIds) to analyze data.
    managedDataIdentifierIds :: Prelude.Maybe [Prelude.Text],
    -- | The current status of the job. Possible values are:
    --
    -- -   CANCELLED - You cancelled the job or, if it\'s a one-time job, you
    --     paused the job and didn\'t resume it within 30 days.
    --
    -- -   COMPLETE - For a one-time job, Amazon Macie finished processing the
    --     data specified for the job. This value doesn\'t apply to recurring
    --     jobs.
    --
    -- -   IDLE - For a recurring job, the previous scheduled run is complete
    --     and the next scheduled run is pending. This value doesn\'t apply to
    --     one-time jobs.
    --
    -- -   PAUSED - Macie started running the job but additional processing
    --     would exceed the monthly sensitive data discovery quota for your
    --     account or one or more member accounts that the job analyzes data
    --     for.
    --
    -- -   RUNNING - For a one-time job, the job is in progress. For a
    --     recurring job, a scheduled run is in progress.
    --
    -- -   USER_PAUSED - You paused the job. If you paused the job while it had
    --     a status of RUNNING and you don\'t resume it within 30 days of
    --     pausing it, the job or job run will expire and be cancelled,
    --     depending on the job\'s type. To check the expiration date, refer to
    --     the UserPausedDetails.jobExpiresAt property.
    jobStatus :: Prelude.Maybe JobStatus,
    -- | The custom description of the job.
    description :: Prelude.Maybe Prelude.Text,
    -- | A map of key-value pairs that specifies which tags (keys and values) are
    -- associated with the classification job.
    tags :: Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text),
    -- | The recurrence pattern for running the job. This value is null if the
    -- job is configured to run only once.
    scheduleFrequency :: Prelude.Maybe JobScheduleFrequency,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'DescribeClassificationJobResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'lastRunErrorStatus', 'describeClassificationJobResponse_lastRunErrorStatus' - Specifies whether any account- or bucket-level access errors occurred
-- when the job ran. For a recurring job, this value indicates the error
-- status of the job\'s most recent run.
--
-- 'jobType', 'describeClassificationJobResponse_jobType' - The schedule for running the job. Possible values are:
--
-- -   ONE_TIME - The job runs only once.
--
-- -   SCHEDULED - The job runs on a daily, weekly, or monthly basis. The
--     scheduleFrequency property indicates the recurrence pattern for the
--     job.
--
-- 'initialRun', 'describeClassificationJobResponse_initialRun' - For a recurring job, specifies whether you configured the job to analyze
-- all existing, eligible objects immediately after the job was created
-- (true). If you configured the job to analyze only those objects that
-- were created or changed after the job was created and before the job\'s
-- first scheduled run, this value is false. This value is also false for a
-- one-time job.
--
-- 'jobId', 'describeClassificationJobResponse_jobId' - The unique identifier for the job.
--
-- 'clientToken', 'describeClassificationJobResponse_clientToken' - The token that was provided to ensure the idempotency of the request to
-- create the job.
--
-- 'jobArn', 'describeClassificationJobResponse_jobArn' - The Amazon Resource Name (ARN) of the job.
--
-- 's3JobDefinition', 'describeClassificationJobResponse_s3JobDefinition' - The S3 buckets that contain the objects to analyze, and the scope of
-- that analysis.
--
-- 'createdAt', 'describeClassificationJobResponse_createdAt' - The date and time, in UTC and extended ISO 8601 format, when the job was
-- created.
--
-- 'userPausedDetails', 'describeClassificationJobResponse_userPausedDetails' - If the current status of the job is USER_PAUSED, specifies when the job
-- was paused and when the job or job run will expire and be cancelled if
-- it isn\'t resumed. This value is present only if the value for jobStatus
-- is USER_PAUSED.
--
-- 'samplingPercentage', 'describeClassificationJobResponse_samplingPercentage' - The sampling depth, as a percentage, that determines the percentage of
-- eligible objects that the job analyzes.
--
-- 'managedDataIdentifierSelector', 'describeClassificationJobResponse_managedDataIdentifierSelector' - The selection type that determines which managed data identifiers the
-- job uses to analyze data. Possible values are:
--
-- -   ALL - Use all the managed data identifiers that Amazon Macie
--     provides.
--
-- -   EXCLUDE - Use all the managed data identifiers that Macie provides
--     except the managed data identifiers specified by the
--     managedDataIdentifierIds property.
--
-- -   INCLUDE - Use only the managed data identifiers specified by the
--     managedDataIdentifierIds property.
--
-- -   NONE - Don\'t use any managed data identifiers.
--
-- If this value is null, the job uses all managed data identifiers. If
-- this value is null, ALL, or EXCLUDE for a recurring job, the job also
-- uses new managed data identifiers as they are released.
--
-- 'lastRunTime', 'describeClassificationJobResponse_lastRunTime' - The date and time, in UTC and extended ISO 8601 format, when the job
-- started. If the job is a recurring job, this value indicates when the
-- most recent run started.
--
-- 'customDataIdentifierIds', 'describeClassificationJobResponse_customDataIdentifierIds' - An array of unique identifiers, one for each custom data identifier that
-- the job uses to analyze data. This value is null if the job uses only
-- managed data identifiers to analyze data.
--
-- 'name', 'describeClassificationJobResponse_name' - The custom name of the job.
--
-- 'statistics', 'describeClassificationJobResponse_statistics' - The number of times that the job has run and processing statistics for
-- the job\'s current run.
--
-- 'managedDataIdentifierIds', 'describeClassificationJobResponse_managedDataIdentifierIds' - An array of unique identifiers, one for each managed data identifier
-- that the job is explicitly configured to include (use) or exclude (not
-- use) when it analyzes data. Inclusion or exclusion depends on the
-- managed data identifier selection type specified for the job
-- (managedDataIdentifierSelector). This value is null if the job\'s
-- managed data identifier selection type is ALL or the job uses only
-- custom data identifiers (customDataIdentifierIds) to analyze data.
--
-- 'jobStatus', 'describeClassificationJobResponse_jobStatus' - The current status of the job. Possible values are:
--
-- -   CANCELLED - You cancelled the job or, if it\'s a one-time job, you
--     paused the job and didn\'t resume it within 30 days.
--
-- -   COMPLETE - For a one-time job, Amazon Macie finished processing the
--     data specified for the job. This value doesn\'t apply to recurring
--     jobs.
--
-- -   IDLE - For a recurring job, the previous scheduled run is complete
--     and the next scheduled run is pending. This value doesn\'t apply to
--     one-time jobs.
--
-- -   PAUSED - Macie started running the job but additional processing
--     would exceed the monthly sensitive data discovery quota for your
--     account or one or more member accounts that the job analyzes data
--     for.
--
-- -   RUNNING - For a one-time job, the job is in progress. For a
--     recurring job, a scheduled run is in progress.
--
-- -   USER_PAUSED - You paused the job. If you paused the job while it had
--     a status of RUNNING and you don\'t resume it within 30 days of
--     pausing it, the job or job run will expire and be cancelled,
--     depending on the job\'s type. To check the expiration date, refer to
--     the UserPausedDetails.jobExpiresAt property.
--
-- 'description', 'describeClassificationJobResponse_description' - The custom description of the job.
--
-- 'tags', 'describeClassificationJobResponse_tags' - A map of key-value pairs that specifies which tags (keys and values) are
-- associated with the classification job.
--
-- 'scheduleFrequency', 'describeClassificationJobResponse_scheduleFrequency' - The recurrence pattern for running the job. This value is null if the
-- job is configured to run only once.
--
-- 'httpStatus', 'describeClassificationJobResponse_httpStatus' - The response's http status code.
newDescribeClassificationJobResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  DescribeClassificationJobResponse
newDescribeClassificationJobResponse pHttpStatus_ =
  DescribeClassificationJobResponse'
    { lastRunErrorStatus =
        Prelude.Nothing,
      jobType = Prelude.Nothing,
      initialRun = Prelude.Nothing,
      jobId = Prelude.Nothing,
      clientToken = Prelude.Nothing,
      jobArn = Prelude.Nothing,
      s3JobDefinition = Prelude.Nothing,
      createdAt = Prelude.Nothing,
      userPausedDetails = Prelude.Nothing,
      samplingPercentage = Prelude.Nothing,
      managedDataIdentifierSelector =
        Prelude.Nothing,
      lastRunTime = Prelude.Nothing,
      customDataIdentifierIds =
        Prelude.Nothing,
      name = Prelude.Nothing,
      statistics = Prelude.Nothing,
      managedDataIdentifierIds =
        Prelude.Nothing,
      jobStatus = Prelude.Nothing,
      description = Prelude.Nothing,
      tags = Prelude.Nothing,
      scheduleFrequency = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | Specifies whether any account- or bucket-level access errors occurred
-- when the job ran. For a recurring job, this value indicates the error
-- status of the job\'s most recent run.
describeClassificationJobResponse_lastRunErrorStatus :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe LastRunErrorStatus)
describeClassificationJobResponse_lastRunErrorStatus = Lens.lens (\DescribeClassificationJobResponse' {lastRunErrorStatus} -> lastRunErrorStatus) (\s@DescribeClassificationJobResponse' {} a -> s {lastRunErrorStatus = a} :: DescribeClassificationJobResponse)

-- | The schedule for running the job. Possible values are:
--
-- -   ONE_TIME - The job runs only once.
--
-- -   SCHEDULED - The job runs on a daily, weekly, or monthly basis. The
--     scheduleFrequency property indicates the recurrence pattern for the
--     job.
describeClassificationJobResponse_jobType :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe JobType)
describeClassificationJobResponse_jobType = Lens.lens (\DescribeClassificationJobResponse' {jobType} -> jobType) (\s@DescribeClassificationJobResponse' {} a -> s {jobType = a} :: DescribeClassificationJobResponse)

-- | For a recurring job, specifies whether you configured the job to analyze
-- all existing, eligible objects immediately after the job was created
-- (true). If you configured the job to analyze only those objects that
-- were created or changed after the job was created and before the job\'s
-- first scheduled run, this value is false. This value is also false for a
-- one-time job.
describeClassificationJobResponse_initialRun :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.Bool)
describeClassificationJobResponse_initialRun = Lens.lens (\DescribeClassificationJobResponse' {initialRun} -> initialRun) (\s@DescribeClassificationJobResponse' {} a -> s {initialRun = a} :: DescribeClassificationJobResponse)

-- | The unique identifier for the job.
describeClassificationJobResponse_jobId :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.Text)
describeClassificationJobResponse_jobId = Lens.lens (\DescribeClassificationJobResponse' {jobId} -> jobId) (\s@DescribeClassificationJobResponse' {} a -> s {jobId = a} :: DescribeClassificationJobResponse)

-- | The token that was provided to ensure the idempotency of the request to
-- create the job.
describeClassificationJobResponse_clientToken :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.Text)
describeClassificationJobResponse_clientToken = Lens.lens (\DescribeClassificationJobResponse' {clientToken} -> clientToken) (\s@DescribeClassificationJobResponse' {} a -> s {clientToken = a} :: DescribeClassificationJobResponse)

-- | The Amazon Resource Name (ARN) of the job.
describeClassificationJobResponse_jobArn :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.Text)
describeClassificationJobResponse_jobArn = Lens.lens (\DescribeClassificationJobResponse' {jobArn} -> jobArn) (\s@DescribeClassificationJobResponse' {} a -> s {jobArn = a} :: DescribeClassificationJobResponse)

-- | The S3 buckets that contain the objects to analyze, and the scope of
-- that analysis.
describeClassificationJobResponse_s3JobDefinition :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe S3JobDefinition)
describeClassificationJobResponse_s3JobDefinition = Lens.lens (\DescribeClassificationJobResponse' {s3JobDefinition} -> s3JobDefinition) (\s@DescribeClassificationJobResponse' {} a -> s {s3JobDefinition = a} :: DescribeClassificationJobResponse)

-- | The date and time, in UTC and extended ISO 8601 format, when the job was
-- created.
describeClassificationJobResponse_createdAt :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.UTCTime)
describeClassificationJobResponse_createdAt = Lens.lens (\DescribeClassificationJobResponse' {createdAt} -> createdAt) (\s@DescribeClassificationJobResponse' {} a -> s {createdAt = a} :: DescribeClassificationJobResponse) Prelude.. Lens.mapping Core._Time

-- | If the current status of the job is USER_PAUSED, specifies when the job
-- was paused and when the job or job run will expire and be cancelled if
-- it isn\'t resumed. This value is present only if the value for jobStatus
-- is USER_PAUSED.
describeClassificationJobResponse_userPausedDetails :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe UserPausedDetails)
describeClassificationJobResponse_userPausedDetails = Lens.lens (\DescribeClassificationJobResponse' {userPausedDetails} -> userPausedDetails) (\s@DescribeClassificationJobResponse' {} a -> s {userPausedDetails = a} :: DescribeClassificationJobResponse)

-- | The sampling depth, as a percentage, that determines the percentage of
-- eligible objects that the job analyzes.
describeClassificationJobResponse_samplingPercentage :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.Int)
describeClassificationJobResponse_samplingPercentage = Lens.lens (\DescribeClassificationJobResponse' {samplingPercentage} -> samplingPercentage) (\s@DescribeClassificationJobResponse' {} a -> s {samplingPercentage = a} :: DescribeClassificationJobResponse)

-- | The selection type that determines which managed data identifiers the
-- job uses to analyze data. Possible values are:
--
-- -   ALL - Use all the managed data identifiers that Amazon Macie
--     provides.
--
-- -   EXCLUDE - Use all the managed data identifiers that Macie provides
--     except the managed data identifiers specified by the
--     managedDataIdentifierIds property.
--
-- -   INCLUDE - Use only the managed data identifiers specified by the
--     managedDataIdentifierIds property.
--
-- -   NONE - Don\'t use any managed data identifiers.
--
-- If this value is null, the job uses all managed data identifiers. If
-- this value is null, ALL, or EXCLUDE for a recurring job, the job also
-- uses new managed data identifiers as they are released.
describeClassificationJobResponse_managedDataIdentifierSelector :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe ManagedDataIdentifierSelector)
describeClassificationJobResponse_managedDataIdentifierSelector = Lens.lens (\DescribeClassificationJobResponse' {managedDataIdentifierSelector} -> managedDataIdentifierSelector) (\s@DescribeClassificationJobResponse' {} a -> s {managedDataIdentifierSelector = a} :: DescribeClassificationJobResponse)

-- | The date and time, in UTC and extended ISO 8601 format, when the job
-- started. If the job is a recurring job, this value indicates when the
-- most recent run started.
describeClassificationJobResponse_lastRunTime :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.UTCTime)
describeClassificationJobResponse_lastRunTime = Lens.lens (\DescribeClassificationJobResponse' {lastRunTime} -> lastRunTime) (\s@DescribeClassificationJobResponse' {} a -> s {lastRunTime = a} :: DescribeClassificationJobResponse) Prelude.. Lens.mapping Core._Time

-- | An array of unique identifiers, one for each custom data identifier that
-- the job uses to analyze data. This value is null if the job uses only
-- managed data identifiers to analyze data.
describeClassificationJobResponse_customDataIdentifierIds :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe [Prelude.Text])
describeClassificationJobResponse_customDataIdentifierIds = Lens.lens (\DescribeClassificationJobResponse' {customDataIdentifierIds} -> customDataIdentifierIds) (\s@DescribeClassificationJobResponse' {} a -> s {customDataIdentifierIds = a} :: DescribeClassificationJobResponse) Prelude.. Lens.mapping Lens.coerced

-- | The custom name of the job.
describeClassificationJobResponse_name :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.Text)
describeClassificationJobResponse_name = Lens.lens (\DescribeClassificationJobResponse' {name} -> name) (\s@DescribeClassificationJobResponse' {} a -> s {name = a} :: DescribeClassificationJobResponse)

-- | The number of times that the job has run and processing statistics for
-- the job\'s current run.
describeClassificationJobResponse_statistics :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Statistics)
describeClassificationJobResponse_statistics = Lens.lens (\DescribeClassificationJobResponse' {statistics} -> statistics) (\s@DescribeClassificationJobResponse' {} a -> s {statistics = a} :: DescribeClassificationJobResponse)

-- | An array of unique identifiers, one for each managed data identifier
-- that the job is explicitly configured to include (use) or exclude (not
-- use) when it analyzes data. Inclusion or exclusion depends on the
-- managed data identifier selection type specified for the job
-- (managedDataIdentifierSelector). This value is null if the job\'s
-- managed data identifier selection type is ALL or the job uses only
-- custom data identifiers (customDataIdentifierIds) to analyze data.
describeClassificationJobResponse_managedDataIdentifierIds :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe [Prelude.Text])
describeClassificationJobResponse_managedDataIdentifierIds = Lens.lens (\DescribeClassificationJobResponse' {managedDataIdentifierIds} -> managedDataIdentifierIds) (\s@DescribeClassificationJobResponse' {} a -> s {managedDataIdentifierIds = a} :: DescribeClassificationJobResponse) Prelude.. Lens.mapping Lens.coerced

-- | The current status of the job. Possible values are:
--
-- -   CANCELLED - You cancelled the job or, if it\'s a one-time job, you
--     paused the job and didn\'t resume it within 30 days.
--
-- -   COMPLETE - For a one-time job, Amazon Macie finished processing the
--     data specified for the job. This value doesn\'t apply to recurring
--     jobs.
--
-- -   IDLE - For a recurring job, the previous scheduled run is complete
--     and the next scheduled run is pending. This value doesn\'t apply to
--     one-time jobs.
--
-- -   PAUSED - Macie started running the job but additional processing
--     would exceed the monthly sensitive data discovery quota for your
--     account or one or more member accounts that the job analyzes data
--     for.
--
-- -   RUNNING - For a one-time job, the job is in progress. For a
--     recurring job, a scheduled run is in progress.
--
-- -   USER_PAUSED - You paused the job. If you paused the job while it had
--     a status of RUNNING and you don\'t resume it within 30 days of
--     pausing it, the job or job run will expire and be cancelled,
--     depending on the job\'s type. To check the expiration date, refer to
--     the UserPausedDetails.jobExpiresAt property.
describeClassificationJobResponse_jobStatus :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe JobStatus)
describeClassificationJobResponse_jobStatus = Lens.lens (\DescribeClassificationJobResponse' {jobStatus} -> jobStatus) (\s@DescribeClassificationJobResponse' {} a -> s {jobStatus = a} :: DescribeClassificationJobResponse)

-- | The custom description of the job.
describeClassificationJobResponse_description :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe Prelude.Text)
describeClassificationJobResponse_description = Lens.lens (\DescribeClassificationJobResponse' {description} -> description) (\s@DescribeClassificationJobResponse' {} a -> s {description = a} :: DescribeClassificationJobResponse)

-- | A map of key-value pairs that specifies which tags (keys and values) are
-- associated with the classification job.
describeClassificationJobResponse_tags :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe (Prelude.HashMap Prelude.Text Prelude.Text))
describeClassificationJobResponse_tags = Lens.lens (\DescribeClassificationJobResponse' {tags} -> tags) (\s@DescribeClassificationJobResponse' {} a -> s {tags = a} :: DescribeClassificationJobResponse) Prelude.. Lens.mapping Lens.coerced

-- | The recurrence pattern for running the job. This value is null if the
-- job is configured to run only once.
describeClassificationJobResponse_scheduleFrequency :: Lens.Lens' DescribeClassificationJobResponse (Prelude.Maybe JobScheduleFrequency)
describeClassificationJobResponse_scheduleFrequency = Lens.lens (\DescribeClassificationJobResponse' {scheduleFrequency} -> scheduleFrequency) (\s@DescribeClassificationJobResponse' {} a -> s {scheduleFrequency = a} :: DescribeClassificationJobResponse)

-- | The response's http status code.
describeClassificationJobResponse_httpStatus :: Lens.Lens' DescribeClassificationJobResponse Prelude.Int
describeClassificationJobResponse_httpStatus = Lens.lens (\DescribeClassificationJobResponse' {httpStatus} -> httpStatus) (\s@DescribeClassificationJobResponse' {} a -> s {httpStatus = a} :: DescribeClassificationJobResponse)

instance
  Prelude.NFData
    DescribeClassificationJobResponse
