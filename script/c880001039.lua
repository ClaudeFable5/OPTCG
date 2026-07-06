-- AUTO-GENERATED: OP08-063 / 샬롯 카타쿠리
-- rules_id=OP08-063 script_id=880001039 fingerprint=ef23560f2deb0d8f100ecaeacdc51fd547d1f485d3c4cf408b837a9fdeb1c609
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-063]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            player=[[YOU]],
            state=[[ACTIVE]],
          },
        },
        conditions={},
        costs={
          {
            count=1,
            faceup=false,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위에서 1장을 뒷면으로 할 수 있다: 자신의 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-063]],
    schema_version=1,
  })
end
