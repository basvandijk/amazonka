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
-- Module      : Amazonka.ImageBuilder.Types.OutputResources
-- Copyright   : (c) 2013-2021 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay+amazonka@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
module Amazonka.ImageBuilder.Types.OutputResources where

import qualified Amazonka.Core as Core
import Amazonka.ImageBuilder.Types.Ami
import Amazonka.ImageBuilder.Types.Container
import qualified Amazonka.Lens as Lens
import qualified Amazonka.Prelude as Prelude

-- | The resources produced by this image.
--
-- /See:/ 'newOutputResources' smart constructor.
data OutputResources = OutputResources'
  { -- | Container images that the pipeline has generated and stored in the
    -- output repository.
    containers :: Prelude.Maybe [Container],
    -- | The Amazon EC2 AMIs created by this image.
    amis :: Prelude.Maybe [Ami]
  }
  deriving (Prelude.Eq, Prelude.Read, Prelude.Show, Prelude.Generic)

-- |
-- Create a value of 'OutputResources' with all optional fields omitted.
--
-- Use <https://hackage.haskell.org/package/generic-lens generic-lens> or <https://hackage.haskell.org/package/optics optics> to modify other optional fields.
--
-- The following record fields are available, with the corresponding lenses provided
-- for backwards compatibility:
--
-- 'containers', 'outputResources_containers' - Container images that the pipeline has generated and stored in the
-- output repository.
--
-- 'amis', 'outputResources_amis' - The Amazon EC2 AMIs created by this image.
newOutputResources ::
  OutputResources
newOutputResources =
  OutputResources'
    { containers = Prelude.Nothing,
      amis = Prelude.Nothing
    }

-- | Container images that the pipeline has generated and stored in the
-- output repository.
outputResources_containers :: Lens.Lens' OutputResources (Prelude.Maybe [Container])
outputResources_containers = Lens.lens (\OutputResources' {containers} -> containers) (\s@OutputResources' {} a -> s {containers = a} :: OutputResources) Prelude.. Lens.mapping Lens.coerced

-- | The Amazon EC2 AMIs created by this image.
outputResources_amis :: Lens.Lens' OutputResources (Prelude.Maybe [Ami])
outputResources_amis = Lens.lens (\OutputResources' {amis} -> amis) (\s@OutputResources' {} a -> s {amis = a} :: OutputResources) Prelude.. Lens.mapping Lens.coerced

instance Core.FromJSON OutputResources where
  parseJSON =
    Core.withObject
      "OutputResources"
      ( \x ->
          OutputResources'
            Prelude.<$> (x Core..:? "containers" Core..!= Prelude.mempty)
            Prelude.<*> (x Core..:? "amis" Core..!= Prelude.mempty)
      )

instance Prelude.Hashable OutputResources where
  hashWithSalt salt' OutputResources' {..} =
    salt' `Prelude.hashWithSalt` amis
      `Prelude.hashWithSalt` containers

instance Prelude.NFData OutputResources where
  rnf OutputResources' {..} =
    Prelude.rnf containers
      `Prelude.seq` Prelude.rnf amis
