-- AUTO-GENERATED: OP01-042 / 코무라사키
-- rules_id=OP01-042 script_id=880000165 fingerprint=eee5a576ab3e7730e55b5d83186afb0e56ee2a714d78a574361156efaf317273
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP01-042]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[SET_ACTIVE]],
            selector={
              count=1,
              filter={
                cost_lte=3,
                trait=[[와노쿠니]],
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={
          {
            name=[[코즈키 오뎅]],
            op=[[LEADER_NAME_IS]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=3,
            op=[[REST_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】3(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다): 자신의 리더가 「코즈키 오뎅」인 경우, 자신의 코스트 3 이하인 《와노쿠니》 특징을 가진 캐릭터를 1장까지 액티브로 한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
    },
    keywords={},
    rules_id=[[OP01-042]],
    schema_version=1,
  })
end
