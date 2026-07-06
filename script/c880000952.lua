-- AUTO-GENERATED: OP07-097 / 베가펑크
-- rules_id=OP07-097 script_id=880000952 fingerprint=85b86dbf85c14e1ac79e0ada40825b50f0af85f0bb6ed28c9bc1fb476c0820cd
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-097]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[CANNOT_ATTACK]],
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
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 리더는 어택할 수 없다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  count=1,
                  faceup=true,
                  filter={
                    cost_lte=5,
                    trait=[[에그 헤드]],
                  },
                  mode=[[UP_TO]],
                  op=[[ADD_LIFE_FROM_HAND]],
                  player=[[YOU]],
                },
              },
              {
                {
                  count=1,
                  filter={
                    card_type=[[CHARACTER]],
                    cost_lte=5,
                    trait=[[에그 헤드]],
                  },
                  mode=[[UP_TO]],
                  op=[[PLAY_FROM_HAND]],
                  player=[[YOU]],
                  rested=false,
                },
              },
            },
            player=[[YOU]],
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
        source_text=[[【기동: 메인】【턴 1회】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 패에서 코스트 5 이하인 《에그 헤드》 특징을 가진 카드를 1장까지 라이프 맨 위에 앞면으로 더하거나 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-097]],
    schema_version=1,
  })
end
