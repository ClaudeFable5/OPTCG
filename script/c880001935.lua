-- AUTO-GENERATED: ST14-017 / 사우전드 써니 호
-- rules_id=ST14-017 script_id=880001935 fingerprint=6366170b9d1ae711fe5dcdcc7d7470ae540da700cbbf8e0201c09a406a5796aa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST14-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=1,
            duration=[[WHILE_CONDITION]],
            op=[[MODIFY_COST]],
            selector={
              count=0,
              filter={
                color=[[BLACK]],
                trait=[[밀짚모자 일당]],
              },
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
        source_text=[[자신의 흑색인 《밀짚모자 일당》 특징을 가진 모든 캐릭터의 코스트 +1.]],
        timings={
          [[CONTINUOUS]],
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
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[밀짚모자 일당]],
          },
        },
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《밀짚모자 일당》 특징을 가진 경우, 카드를 1장 뽑는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST14-017]],
    schema_version=1,
  })
end
