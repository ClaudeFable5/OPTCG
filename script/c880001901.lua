-- AUTO-GENERATED: ST13-002 / 포트거스 D. 에이스
-- rules_id=ST13-002 script_id=880001901 fingerprint=6a60a7399a3a0da70393796cd7008bccbf0bd2faeb72dccc1d25f9b02c1e400a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST13-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            destination=[[LIFE_TOP]],
            faceup=true,
            filter={
              card_type=[[CHARACTER]],
              cost_eq=5,
            },
            look_count=5,
            op=[[SEARCH_DECK_TOP]],
            player=[[YOU]],
            rest_destination=[[DECK_BOTTOM]],
            rest_order=[[CHOOSE]],
            reveal=true,
            select_count=1,
            select_mode=[[UP_TO]],
          },
        },
        conditions={},
        costs={},
        don_attached=2,
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【두웅!!×2】【기동: 메인】【턴 1회】자신의 덱 위에서 5장을 보고, 코스트 5인 캐릭터 카드 1장까지를 라이프 맨 위에 앞면으로 더한다. 그 후, 남은 카드를 원하는 순서대로 덱 맨 아래로 되돌린다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            op=[[TRASH_FACEUP_LIFE_ALL]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【자신의 턴 종료 시】자신의 라이프의 앞면인 모든 카드를 트래시에 놓는다.]],
        timings={
          [[YOUR_TURN_END]],
        },
      },
    },
    keywords={},
    rules_id=[[ST13-002]],
    schema_version=1,
  })
end
