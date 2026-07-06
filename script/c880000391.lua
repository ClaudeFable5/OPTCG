-- AUTO-GENERATED: OP03-025 / 클리크
-- rules_id=OP03-025 script_id=880000391 fingerprint=10c97154de2ded6c645df93098ad58245fe36ff14f40e8b101880d41efc05926
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-025]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=2,
              filter={
                cost_lte=4,
                state=[[RESTED]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
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
        source_text=[[【등장 시】자신의 패 1장을 버릴 수 있다: 상대의 레스트 상태이고 코스트 4 이하인 캐릭터를 2장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            keyword=[[DOUBLE_ATTACK]],
            op=[[GAIN_KEYWORD]],
            selector={
              count=1,
              kind=[[SELF]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】이 캐릭터는 【더블 어택】을 얻는다.
(이 카드가 주는 대미지는 2가 된다)]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-025]],
    schema_version=1,
  })
end
