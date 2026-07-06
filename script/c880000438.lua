-- AUTO-GENERATED: OP03-072 / 고무고무 JET 총난타
-- rules_id=OP03-072 script_id=880000438 fingerprint=4cb1c4f555eb8912d1e0a79a2ca34b586f66cbb57a248d28a906fb78fa8c745f
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-072]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=3000,
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
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【카운터】자신의 패 1장을 버릴 수 있다: 이번 배틀 동안, 자신의 리더 또는 캐릭터 1장까지의 파워 +3000.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-072]],
    schema_version=1,
  })
end
