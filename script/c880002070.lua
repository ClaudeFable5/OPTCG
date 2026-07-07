-- AUTO-GENERATED: P-108 / 몽키 D. 루피
-- rules_id=P-108 script_id=880002070 fingerprint=b4e6baa7c8114ad1bbd0d99a994eaa7404524c443ae048a52aff43628b39f490
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[P-108]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[P-108]],
    schema_version=1,
  })
end
