-- AUTO-GENERATED: OP09-023 / 아디오
-- rules_id=OP09-023 script_id=880001118 fingerprint=17b8d1c257b4bb9256522518badc31396183bf360e7e0d8fc0f466d074810c3a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-023]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=3,
            mode=[[UP_TO]],
            op=[[SET_DON_ACTIVE]],
            player=[[YOU]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[ODYSSEY]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《ODYSSEY》 특징을 가진 경우, 자신의 두웅!!을 3장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            amount=2000,
            duration=[[THIS_BATTLE]],
            op=[[MODIFY_POWER]],
            selector={
              count=1,
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】자신의 두웅!! 1장을 레스트할 수 있다: 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +2000.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-023]],
    schema_version=1,
  })
end
