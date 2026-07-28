-- AUTO-GENERATED: OP15-028 / 냐반 브라더스
-- rules_id=OP15-028 script_id=880002330 fingerprint=673bd4cf5b0c8f1ef6551e4b17b2018b89cc5401be553049b26e8fcadca4025d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP15-028]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[GIVE_OPPONENT_DON]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[이스트 블루]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《이스트 블루》 특징을 가진 경우, 상대의 캐릭터 1장에 상대의 코스트 에리어의 두웅!! 1장까지를 붙인다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP15-028]],
    schema_version=1,
  })
end
