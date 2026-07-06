-- AUTO-GENERATED: EB01-052 / 비올라
-- rules_id=EB01-052 script_id=880000051 fingerprint=1ae82c755b4cd45ecc843faac06c6c9e5215edc5a643d7a21874aa53f62dda2c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-052]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[CHOOSE]],
            options={
              {
                {
                  op=[[LOOK_REORDER_ALL_LIFE]],
                  order=[[CHOOSE]],
                  player=[[OPPONENT]],
                },
              },
              {
                {
                  op=[[SET_ALL_LIFE_FACE_DOWN]],
                  player=[[YOU]],
                },
              },
            },
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【등장 시】아래에서 하나를 선택한다.
・상대의 모든 라이프를 보고 원하는 순서대로 놓는다.
・자신의 모든 라이프를 뒷면으로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB01-052]],
    schema_version=1,
  })
end
