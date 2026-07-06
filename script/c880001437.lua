-- AUTO-GENERATED: OP11-103 / 샤쿠레
-- rules_id=OP11-103 script_id=880001437 fingerprint=d3278c612c8445c92f18b3ace5567b48962743f3bd470b037eec96c17d7eaae4
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP11-103]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[KO]],
            selector={
              count=1,
              filter={
                cost_lte=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
        },
        conditions={
          {
            name=[[시라호시]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            faceup=false,
            op=[[FLIP_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 리더가 「시라호시」인 경우, 이 캐릭터를 레스트하고, 자신의 라이프 위에서 1장을 뒷면으로 할 수 있다: 상대의 코스트 3 이하인 캐릭터를 1장까지 KO 시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP11-103]],
    schema_version=1,
  })
end
