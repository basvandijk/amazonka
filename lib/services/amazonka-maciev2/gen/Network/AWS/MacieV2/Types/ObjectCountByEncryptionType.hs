{-# LANGUAGE DeriveGeneric #-}
{-# LANGUAGE DuplicateRecordFields #-}
{-# LANGUAGE NamedFieldPuns #-}
{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE RecordWildCards #-}
{-# LANGUAGE StrictData #-}
{-# LANGUAGE NoImplicitPrelude #-}
{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.MacieV2.Types.ObjectCountByEncryptionType
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Network.AWS.MacieV2.Types.ObjectCountByEncryptionType where

import qualified Network.AWS.Core as Core
import qualified Network.AWS.Lens as Lens
import qualified Network.AWS.Prelude as Prelude

-- | Provides information about the number of objects that are in an S3
-- bucket and use certain types of server-side encryption, use client-side
-- encryption, or aren\'t encrypted.
--
-- /See:/ 'newObjectCountByEncryptionType' smart constructor.
data ObjectCountByEncryptionType = ObjectCountByEncryptionType'
  { -- | The total number of objects that Amazon Macie doesn\'t have current
    -- encryption metadata for. Macie can\'t provide current data about the
    -- encryption settings for these objects.
    unknown :: Prelude.Maybe Prelude.Integer,
    -- | The total number of objects that are encrypted with an Amazon S3 managed
    -- key. The objects use Amazon S3 managed encryption (SSE-S3).
    s3Managed :: Prelude.Maybe Prelude.Integer,
    -- | The total number of objects that aren\'t encrypted or use client-side
    -- encryption.
    unencrypted :: Prelude.Maybe Prelude.Integer,
    -- | The total number of objects that are encrypted with an KMS key, either
    -- an Amazon Web Services managed key or a customer managed key. The
    -- objects use KMS encryption (SSE-KMS).
    kmsManaged :: Prelude.Maybe Prelude.Integer,
    -- | The total number of objects that are encrypted with a customer-provided
    -- key. The objects use customer-provided server-side encryption (SSE-C).
    customerManaged :: Prelude.Maybe Prelude.Integer
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'ObjectCountByEncryptionType' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'unknown', 'objectCountByEncryptionType_unknown' - The total number of objects that Amazon Macie doesn\'t have current
-- encryption metadata for. Macie can\'t provide current data about the
-- encryption settings for these objects.
--
-- 's3Managed', 'objectCountByEncryptionType_s3Managed' - The total number of objects that are encrypted with an Amazon S3 managed
-- key. The objects use Amazon S3 managed encryption (SSE-S3).
--
-- 'unencrypted', 'objectCountByEncryptionType_unencrypted' - The total number of objects that aren\'t encrypted or use client-side
-- encryption.
--
-- 'kmsManaged', 'objectCountByEncryptionType_kmsManaged' - The total number of objects that are encrypted with an KMS key, either
-- an Amazon Web Services managed key or a customer managed key. The
-- objects use KMS encryption (SSE-KMS).
--
-- 'customerManaged', 'objectCountByEncryptionType_customerManaged' - The total number of objects that are encrypted with a customer-provided
-- key. The objects use customer-provided server-side encryption (SSE-C).
newObjectCountByEncryptionType ::
  ObjectCountByEncryptionType
newObjectCountByEncryptionType =
  ObjectCountByEncryptionType'
    { unknown =
        Prelude.Nothing,
      s3Managed = Prelude.Nothing,
      unencrypted = Prelude.Nothing,
      kmsManaged = Prelude.Nothing,
      customerManaged = Prelude.Nothing
    }

-- | The total number of objects that Amazon Macie doesn\'t have current
-- encryption metadata for. Macie can\'t provide current data about the
-- encryption settings for these objects.
objectCountByEncryptionType_unknown :: Lens.Lens' ObjectCountByEncryptionType (Prelude.Maybe Prelude.Integer)
objectCountByEncryptionType_unknown = Lens.lens (\ObjectCountByEncryptionType' {unknown} -> unknown) (\s@ObjectCountByEncryptionType' {} a -> s {unknown = a} :: ObjectCountByEncryptionType)

-- | The total number of objects that are encrypted with an Amazon S3 managed
-- key. The objects use Amazon S3 managed encryption (SSE-S3).
objectCountByEncryptionType_s3Managed :: Lens.Lens' ObjectCountByEncryptionType (Prelude.Maybe Prelude.Integer)
objectCountByEncryptionType_s3Managed = Lens.lens (\ObjectCountByEncryptionType' {s3Managed} -> s3Managed) (\s@ObjectCountByEncryptionType' {} a -> s {s3Managed = a} :: ObjectCountByEncryptionType)

-- | The total number of objects that aren\'t encrypted or use client-side
-- encryption.
objectCountByEncryptionType_unencrypted :: Lens.Lens' ObjectCountByEncryptionType (Prelude.Maybe Prelude.Integer)
objectCountByEncryptionType_unencrypted = Lens.lens (\ObjectCountByEncryptionType' {unencrypted} -> unencrypted) (\s@ObjectCountByEncryptionType' {} a -> s {unencrypted = a} :: ObjectCountByEncryptionType)

-- | The total number of objects that are encrypted with an KMS key, either
-- an Amazon Web Services managed key or a customer managed key. The
-- objects use KMS encryption (SSE-KMS).
objectCountByEncryptionType_kmsManaged :: Lens.Lens' ObjectCountByEncryptionType (Prelude.Maybe Prelude.Integer)
objectCountByEncryptionType_kmsManaged = Lens.lens (\ObjectCountByEncryptionType' {kmsManaged} -> kmsManaged) (\s@ObjectCountByEncryptionType' {} a -> s {kmsManaged = a} :: ObjectCountByEncryptionType)

-- | The total number of objects that are encrypted with a customer-provided
-- key. The objects use customer-provided server-side encryption (SSE-C).
objectCountByEncryptionType_customerManaged :: Lens.Lens' ObjectCountByEncryptionType (Prelude.Maybe Prelude.Integer)
objectCountByEncryptionType_customerManaged = Lens.lens (\ObjectCountByEncryptionType' {customerManaged} -> customerManaged) (\s@ObjectCountByEncryptionType' {} a -> s {customerManaged = a} :: ObjectCountByEncryptionType)

instance Core.FromJSON ObjectCountByEncryptionType where
  parseJSON =
    Core.withObject
      "ObjectCountByEncryptionType"
      ( \x ->
          ObjectCountByEncryptionType'
            Prelude.<$> (x Core..:? "unknown")
            Prelude.<*> (x Core..:? "s3Managed")
            Prelude.<*> (x Core..:? "unencrypted")
            Prelude.<*> (x Core..:? "kmsManaged")
            Prelude.<*> (x Core..:? "customerManaged")
      )

instance Prelude.Hashable ObjectCountByEncryptionType

instance Prelude.NFData ObjectCountByEncryptionType
