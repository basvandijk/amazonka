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
-- Module      : Amazonka.IoT.SetDefaultAuthorizer
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Sets the default authorizer. This will be used if a websocket connection
-- is made without specifying an authorizer.
--
-- Requires permission to access the
-- <https://docs.aws.amazon.com/service-authorization/latest/reference/list_awsiot.html#awsiot-actions-as-permissions SetDefaultAuthorizer>
-- action.
module Amazonka.IoT.SetDefaultAuthorizer
  ( -- * Creating a Request
    SetDefaultAuthorizer (..),
    newSetDefaultAuthorizer,

    -- * Request Lenses
    setDefaultAuthorizer_authorizerName,

    -- * Destructuring the Response
    SetDefaultAuthorizerResponse (..),
    newSetDefaultAuthorizerResponse,

    -- * Response Lenses
    setDefaultAuthorizerResponse_authorizerName,
    setDefaultAuthorizerResponse_authorizerArn,
    setDefaultAuthorizerResponse_httpStatus,
  )
where

import qualified Amazonka.Core as Core
import Amazonka.IoT.Types
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude
import qualified Amazonka.Request as Request
import qualified Amazonka.Response as Response

-- | /See:/ 'newSetDefaultAuthorizer' smart constructor.
data SetDefaultAuthorizer = SetDefaultAuthorizer'
  { -- | The authorizer name.
    authorizerName :: Prelude.Text
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'SetDefaultAuthorizer' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'authorizerName', 'setDefaultAuthorizer_authorizerName' - The authorizer name.
newSetDefaultAuthorizer ::
  -- | 'authorizerName'
  Prelude.Text ->
  SetDefaultAuthorizer
newSetDefaultAuthorizer pAuthorizerName_ =
  SetDefaultAuthorizer'
    { authorizerName =
        pAuthorizerName_
    }

-- | The authorizer name.
setDefaultAuthorizer_authorizerName :: Lens.Lens' SetDefaultAuthorizer Prelude.Text
setDefaultAuthorizer_authorizerName = Lens.lens (\SetDefaultAuthorizer' {authorizerName} -> authorizerName) (\s@SetDefaultAuthorizer' {} a -> s {authorizerName = a} :: SetDefaultAuthorizer)

instance Core.AWSRequest SetDefaultAuthorizer where
  type
    AWSResponse SetDefaultAuthorizer =
      SetDefaultAuthorizerResponse
  request = Request.postJSON defaultService
  response =
    Response.receiveJSON
      ( \s h x ->
          SetDefaultAuthorizerResponse'
            Prelude.<$> (x Core..?> "authorizerName")
            Prelude.<*> (x Core..?> "authorizerArn")
            Prelude.<*> (Prelude.pure (Prelude.fromEnum s))
      )

instance Prelude.Hashable SetDefaultAuthorizer where
  hashWithSalt salt' SetDefaultAuthorizer' {..} =
    salt' `Prelude.hashWithSalt` authorizerName

instance Prelude.NFData SetDefaultAuthorizer where
  rnf SetDefaultAuthorizer' {..} =
    Prelude.rnf authorizerName

instance Core.ToHeaders SetDefaultAuthorizer where
  toHeaders = Prelude.const Prelude.mempty

instance Core.ToJSON SetDefaultAuthorizer where
  toJSON SetDefaultAuthorizer' {..} =
    Core.object
      ( Prelude.catMaybes
          [ Prelude.Just
              ("authorizerName" Core..= authorizerName)
          ]
      )

instance Core.ToPath SetDefaultAuthorizer where
  toPath = Prelude.const "/default-authorizer"

instance Core.ToQuery SetDefaultAuthorizer where
  toQuery = Prelude.const Prelude.mempty

-- | /See:/ 'newSetDefaultAuthorizerResponse' smart constructor.
data SetDefaultAuthorizerResponse = SetDefaultAuthorizerResponse'
  { -- | The authorizer name.
    authorizerName :: Prelude.Maybe Prelude.Text,
    -- | The authorizer ARN.
    authorizerArn :: Prelude.Maybe Prelude.Text,
    -- | The response's http status code.
    httpStatus :: Prelude.Int
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'SetDefaultAuthorizerResponse' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'authorizerName', 'setDefaultAuthorizerResponse_authorizerName' - The authorizer name.
--
-- 'authorizerArn', 'setDefaultAuthorizerResponse_authorizerArn' - The authorizer ARN.
--
-- 'httpStatus', 'setDefaultAuthorizerResponse_httpStatus' - The response's http status code.
newSetDefaultAuthorizerResponse ::
  -- | 'httpStatus'
  Prelude.Int ->
  SetDefaultAuthorizerResponse
newSetDefaultAuthorizerResponse pHttpStatus_ =
  SetDefaultAuthorizerResponse'
    { authorizerName =
        Prelude.Nothing,
      authorizerArn = Prelude.Nothing,
      httpStatus = pHttpStatus_
    }

-- | The authorizer name.
setDefaultAuthorizerResponse_authorizerName :: Lens.Lens' SetDefaultAuthorizerResponse (Prelude.Maybe Prelude.Text)
setDefaultAuthorizerResponse_authorizerName = Lens.lens (\SetDefaultAuthorizerResponse' {authorizerName} -> authorizerName) (\s@SetDefaultAuthorizerResponse' {} a -> s {authorizerName = a} :: SetDefaultAuthorizerResponse)

-- | The authorizer ARN.
setDefaultAuthorizerResponse_authorizerArn :: Lens.Lens' SetDefaultAuthorizerResponse (Prelude.Maybe Prelude.Text)
setDefaultAuthorizerResponse_authorizerArn = Lens.lens (\SetDefaultAuthorizerResponse' {authorizerArn} -> authorizerArn) (\s@SetDefaultAuthorizerResponse' {} a -> s {authorizerArn = a} :: SetDefaultAuthorizerResponse)

-- | The response's http status code.
setDefaultAuthorizerResponse_httpStatus :: Lens.Lens' SetDefaultAuthorizerResponse Prelude.Int
setDefaultAuthorizerResponse_httpStatus = Lens.lens (\SetDefaultAuthorizerResponse' {httpStatus} -> httpStatus) (\s@SetDefaultAuthorizerResponse' {} a -> s {httpStatus = a} :: SetDefaultAuthorizerResponse)

instance Prelude.NFData SetDefaultAuthorizerResponse where
  rnf SetDefaultAuthorizerResponse' {..} =
    Prelude.rnf authorizerName
      `Prelude.seq` Prelude.rnf httpStatus
      `Prelude.seq` Prelude.rnf authorizerArn
