-- AUTO-GENERATED: PRB02-003 / 럭키 루
-- rules_id=PRB02-003 script_id=880001695 fingerprint=85aa19798c65f97fcd7ca199f465631fca433d827ee4f3dad2656b83088cc14b
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[PRB02-003]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_gte=6000,
            },
            op=[[TRASH_HAND]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 파워 6000 이상인 캐릭터 카드를 1장 버릴 수 있다: 카드를 2장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[PRB02-003]],
    schema_version=1,
  })
end
