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
-- Module      : Amazonka.SMS.GetAppValidationConfiguration
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Retrieves information about a configuration for validating an
-- application.
module Amazonka.SMS.GetAppValidationConfiguration
  ( -- * Creating a Request
    GetAppValidationConfiguration (..),
    newGetAppValidationConfiguration,

    -- * Request Lenses
    getAppValidationConfiguration_appId,

    -- * Destructuring the Response
    GetAppValidationConfigurationResponse (..),
    newGetAppValidationConfigurationResponse,

    -- * Response Lenses
    getAppValidationConfigurationResponse_serverGroupValidationConfigurations,
    getAppValidationConfigurationResponse_appValidationConfigurations,
    getAppValidationConfigurationResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response
import Amazonka.SMS.Types

-- | /See:/ 'newGetAppValidationConfiguration' smart constructor.
data GetAppValidationConfiguration = GetAppValidationConfiguration'
  { -- | The ID of the application.
    appId :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetAppValidationConfiguration' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'appId', 'getAppValidationConfiguration_appId' - The ID of the application.
newGetAppValidationConfiguration ::
  -- | 'appId'
  Prelude.Text ->
  GetAppValidationConfiguration
newGetAppValidationConfiguration pAppId_ =
  GetAppValidationConfiguration' {appId = pAppId_}

-- | The ID of the application.
getAppValidationConfiguration_appId :: Lens.Lens' GetAppValidationConfiguration Prelude.Text
getAppValidationConfiguration_appId = Lens.lens (\GetAppValidationConfiguration' {appId} -> appId) (\s@GetAppValidationConfiguration' {} a -> s {appId = a} :: GetAppValidationConfiguration)

instance
  Core.AWSRequest
    GetAppValidationConfiguration
  where
  type
    AWSResponse GetAppValidationConfiguration =
      GetAppValidationConfigurationResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          GetAppValidationConfigurationResponse'
            Prelude.<$> ( x Core..?> "serverGroupValidationConfigurations"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> ( x Core..?> "appValidationConfigurations"
                            Core..!@ Prelude.mempty
                        )
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance
  Prelude.Hashable
    GetAppValidationConfiguration
  where
  hashWithSalt salt' GetAppValidationConfiguration' {..} =
    salt' `Prelude.hashWithSalt` appId

instance Prelude.NFData GetAppValidationConfiguration where
  rnf GetAppValidationConfiguration' {..} =
    Prelude.rnf appId

instance Core.ToHeaders GetAppValidationConfiguration where
  toHeaders =
    Prelude.const
      ( Prelude.mconcat
          [ "X-Amz-Target"
              Core.=# ( "AWSServerMigrationService_V2016_10_24.GetAppValidationConfiguration" ::
                          Prelude.ByteString
                      ),
            "Content-Type"
              Core.=# ( "application/x-amz-json-1.1" ::
                          Prelude.ByteString
                      )
          ]
      )

instance Core.ToJSON GetAppValidationConfiguration where
  toJSON GetAppValidationConfiguration' {..} =
    Core.object
      ( Prelude.catMaybes
          [Prelude.Just ("appId" Core..= appId)]
      )

instance Core.ToPath GetAppValidationConfiguration where
  toPath = Prelude.const "/"

instance Core.ToQuery GetAppValidationConfiguration where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newGetAppValidationConfigurationResponse' smart constructor.
data GetAppValidationConfigurationResponse = GetAppValidationConfigurationResponse'
  { -- | The configuration for instance validation.
    serverGroupValidationConfigurations :: Prelude.Maybe [ServerGroupValidationConfiguration],
    -- | The configuration for application validation.
    appValidationConfigurations :: Prelude.Maybe [AppValidationConfiguration],
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'GetAppValidationConfigurationResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'serverGroupValidationConfigurations', 'getAppValidationConfigurationResponse_serverGroupValidationConfigurations' - The configuration for instance validation.
--
-- 'appValidationConfigurations', 'getAppValidationConfigurationResponse_appValidationConfigurations' - The configuration for application validation.
--
-- 'httpStatus', 'getAppValidationConfigurationResponse_httpStatus' - The response's http status code.
newGetAppValidationConfigurationResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  GetAppValidationConfigurationResponse
newGetAppValidationConfigurationResponse pHttpStatus_ =
  GetAppValidationConfigurationResponse'
    { serverGroupValidationConfigurations =
        Prelude.Nothing,
      appValidationConfigurations =
        Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The configuration for instance validation.
getAppValidationConfigurationResponse_serverGroupValidationConfigurations :: Lens.Lens' GetAppValidationConfigurationResponse (Prelude.Maybe [ServerGroupValidationConfiguration])
getAppValidationConfigurationResponse_serverGroupValidationConfigurations = Lens.lens (\GetAppValidationConfigurationResponse' {serverGroupValidationConfigurations} -> serverGroupValidationConfigurations) (\s@GetAppValidationConfigurationResponse' {} a -> s {serverGroupValidationConfigurations = a} :: GetAppValidationConfigurationResponse) Prelude.. Lens.mapping Lens.coerced

-- | The configuration for application validation.
getAppValidationConfigurationResponse_appValidationConfigurations :: Lens.Lens' GetAppValidationConfigurationResponse (Prelude.Maybe [AppValidationConfiguration])
getAppValidationConfigurationResponse_appValidationConfigurations = Lens.lens (\GetAppValidationConfigurationResponse' {appValidationConfigurations} -> appValidationConfigurations) (\s@GetAppValidationConfigurationResponse' {} a -> s {appValidationConfigurations = a} :: GetAppValidationConfigurationResponse) Prelude.. Lens.mapping Lens.coerced

-- | The response's http status code.
getAppValidationConfigurationResponse_httpStatus :: Lens.Lens' GetAppValidationConfigurationResponse Prelude.Int
getAppValidationConfigurationResponse_httpStatus = Lens.lens (\GetAppValidationConfigurationResponse' {httpStatus} -> httpStatus) (\s@GetAppValidationConfigurationResponse' {} a -> s {httpStatus = a} :: GetAppValidationConfigurationResponse)

instance
  Prelude.NFData
    GetAppValidationConfigurationResponse
  where
  rnf GetAppValidationConfigurationResponse' {..} =
    Prelude.rnf serverGroupValidationConfigurations
      `Prelude.seq` Prelude.rnf httpStatus
      `Prelude.seq` Prelude.rnf appValidationConfigurations
