-- AUTO-GENERATED: OP01-017 / 니코 로빈
-- rules_id=OP01-017 script_id=880000140 fingerprint=233ecdaaf468808df009df308b6c8d964ad39503757ae799f7b1d33719d11d7c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                power_lte=3000,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】 【어택 시】 상대의 파워 3000 이하인 캐릭터를 1장까지 KO시킨다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-017]],
    schema_version=1,
  })
end
