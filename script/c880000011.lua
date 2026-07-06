-- AUTO-GENERATED: EB01-012 / 캐번디시
-- rules_id=EB01-012 script_id=880000011 fingerprint=1837fa63ed18f8fbcde0c58002893f7ac75980d6866397077849b607c6ebee0c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-012]],
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
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[초신성]],
          },
          {
            name=[[캐번디시]],
            op=[[OTHER_CHARACTER_NAME_ABSENT]],
            player=[[YOU]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】/【어택 시】자신의 리더가 《초신성》 특징을 가지고, 자신의 캐릭터인 다른 「캐번디시」가 없는 경우, 자신의 두웅!!을 2장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[EB01-012]],
    schema_version=1,
  })
end
