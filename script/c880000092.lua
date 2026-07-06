-- AUTO-GENERATED: EB02-030 / 그건 동료의 꿈이 비웃음을 당했을 때야!!!!
-- rules_id=EB02-030 script_id=880000092 fingerprint=cf0970638e3d4081e0da6f5b0ff6be5797d328216960dc4d0f5f16224302cc63
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB02-030]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_TURN]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[BATTLE]],
            replacement_costs={
              {
                count=1,
                op=[[TRASH_HAND]],
              },
            },
            selector={
              count=0,
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】이번 턴 동안, 자신의 모든 캐릭터는 배틀에서 KO 당할 경우, 대신에 자신의 패 1장을 버릴 수 있다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[카드를 1장 뽑는다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[EB02-030]],
    schema_version=1,
  })
end
