-- MANUAL: OP16-018 / 록스타 (2026-08-09 OP16 결전의 시각 이식)
-- JP 공홈 series 550116 기준, ST30 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP16-018]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            op=[[REPLACE_KO]],
            optional=true,
            replacement_costs={
              {
                count=1,
                filter={
                  card_type=[[CHARACTER]],
                  power_gte=6000,
                },
                op=[[TRASH_HAND]],
              },
            },
            selector={
              count=1,
              filter={
                trait=[[빨간 머리 해적단]],
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
        limit=[[ONCE_PER_TURN]],
        once_per_turn=true,
        source_text=[[【턴 1회】 자신의 특징 《빨간 머리 해적단》을 가진 캐릭터가 KO될 경우, 대신 자신의 패에서 파워 6000 이상인 캐릭터 카드 1장을 버릴 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={},
    rules_id=[[OP16-018]],
    schema_version=1,
  })
end
