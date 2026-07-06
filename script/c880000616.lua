-- AUTO-GENERATED: OP05-004 / 엠포리오 이반코프
-- rules_id=OP05-004 script_id=880000616 fingerprint=cb3320895bd9d6c51dfe3c7890149365f976613e8593d5704abe4283b90f54ee
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP05-004]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name_neq=[[엠포리오 이반코프]],
              power_lte=5000,
              trait=[[혁명군]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={
          {
            amount=7000,
            op=[[SELF_POWER_GTE]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】이 캐릭터의 파워가 7000 이상인 경우, 자신의 패에서 「엠포리오 이반코프」 이외의 파워 5000 이하인 《혁명군》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP05-004]],
    schema_version=1,
  })
end
