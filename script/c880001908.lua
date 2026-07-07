-- AUTO-GENERATED: ST13-009 / 샹크스
-- rules_id=ST13-009 script_id=880001908 fingerprint=3ae508ce81eb3f25a68dbfef43fca6a3bb33d0be8f00454576b0e154ab0fa704
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-009]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TRASH_LIFE_TOP]],
            player=[[OPPONENT]],
          },
        },
        conditions={
          {
            count=7,
            op=[[HAND_GTE]],
            player=[[OPPONENT]],
          },
        },
        costs={
          {
            count=1,
            faceup=false,
            op=[[FLIP_LIFE_TOP]],
            target=[[ANY_FACEUP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 앞면인 라이프 1장을 뒷면으로 할 수 있다: 상대의 패가 7장 이상인 경우, 상대의 라이프 위에서 1장까지를 트래시에 놓는다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-009]],
    schema_version=1,
  })
end
