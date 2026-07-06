-- AUTO-GENERATED: OP03-017 / 십자화
-- rules_id=OP03-017 script_id=880000383 fingerprint=b1ad2c7b9176ae0badcc0ee21bd659a967f25c35c6feac3c5997007e827b1ecb
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP03-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-4000,
            duration=[[THIS_TURN]],
            op=[[MODIFY_POWER]],
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
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[흰 수염 해적단]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【메인】/【카운터】자신의 리더가 『흰 수염 해적단』을 포함한 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 파워 -4000.]],
        timings={
          [[MAIN]],
          [[COUNTER]],
        },
      },
      {
        actions={
          {
            effect_timing=[[MAIN]],
            op=[[ACTIVATE_CARD_EFFECT]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드의 【메인】 효과를 발동한다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP03-017]],
    schema_version=1,
  })
end
