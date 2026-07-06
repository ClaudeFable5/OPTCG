-- AUTO-GENERATED: ST13-008 / 사보
-- rules_id=ST13-008 script_id=880001907 fingerprint=680a5b4a8afa551011296739f02129ccd81c3ca1366f625a545cbe6aa6a1225c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-008]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=5,
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
            op=[[TRASH_LIFE_TOP]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 라이프 위 또는 아래에서 1장을 트래시에 놓을 수 있다: 상대의 코스트 5 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-008]],
    schema_version=1,
  })
end
