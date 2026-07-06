-- AUTO-GENERATED: OP06-033 / 반더 덱켄 9세
-- rules_id=OP06-033 script_id=880000767 fingerprint=a895167814142aed13b1539e05384e0aacb7ece9bf77a8c2245abeaab9cd7697
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-033]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
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
            op=[[ALTERNATIVE_COST]],
            options={
              {
                {
                  count=1,
                  filter={
                    trait=[[어인족]],
                  },
                  op=[[TRASH_HAND]],
                },
              },
              {
                {
                  count=1,
                  filter={
                    name=[[방주 노아]],
                  },
                  op=[[TRASH_FIELD_OR_HAND]],
                },
              },
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 패에서 《어인족》 특징을 가진 카드 1장을 버리거나, 자신의 패 또는 필드의 「방주 노아」 1장을 트래시에 놓을 수 있다: 상대의 레스트 상태인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-033]],
    schema_version=1,
  })
end
