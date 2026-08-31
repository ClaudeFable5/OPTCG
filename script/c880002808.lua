-- MANUAL: OP17-102 / 샬롯 오븐 (2026-08-28 OP17 세계최강의 전사 추가)
-- JP 공홈 series 550117 기준, OP16 이식 방식 준수.
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP17-102]],
    compile_status=[[MANUAL]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              name_neq=[[샬롯 오븐]],
              power_lte=4000,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】자신의 트래시에서 「샬롯 오븐」 이외의 파워 4000 이하인 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[OP17-102]],
    schema_version=1,
  })
end
