-- AUTO-GENERATED: OP02-118 / 팔척경곡옥
-- rules_id=OP02-118 script_id=880000363 fingerprint=7c711ef6c43d6126eea05e785543f782205d5f860a200cd4a9bc11cb4610af96
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP02-118]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[THIS_BATTLE]],
            op=[[CANNOT_BE_KO]],
            reason=[[ANY]],
            selector={
              count=1,
              kind=[[CHARACTER]],
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
        source_text=[[【카운터】자신의 패 1장을 버릴 수 있다: 자신의 캐릭터를 1장까지 선택한다. 이번 배틀 동안, 선택된 캐릭터는 KO 당하지 않는다.]],
        timings={
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[STAGE]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[상대의 코스트 3 이하인 스테이지를 1장까지 KO 시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP02-118]],
    schema_version=1,
  })
end
