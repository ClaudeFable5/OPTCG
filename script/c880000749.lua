-- AUTO-GENERATED: OP06-015 / 릴리 카네이션
-- rules_id=OP06-015 script_id=880000749 fingerprint=174a781fb16d433cd1dac3aabc5c8371012ab36b25f0923a2ac88f9d2a7705fe
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-015]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              power_gte=2000,
              power_lte=5000,
              trait=[[FILM]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={
          {
            count=1,
            op=[[TRASH_OWN_CARD]],
            selector={
              count=1,
              filter={
                card_type=[[CHARACTER]],
                power_gte=6000,
              },
              kind=[[CHARACTER]],
              mode=[[EXACT]],
              owner=[[YOU]],
            },
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 파워 6000 이상인 캐릭터 1장을 트래시에 놓을 수 있다: 자신의 트래시에서 파워 2000에서 5000인 《FILM》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-015]],
    schema_version=1,
  })
end
