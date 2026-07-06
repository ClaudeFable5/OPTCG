-- AUTO-GENERATED: OP08-101 / 샬롯 엔젤
-- rules_id=OP08-101 script_id=880001077 fingerprint=a16c0dc60e74bafc11b3ee5097121fc8a5003b338f1edae5db9ef3b20c647b0a
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-101]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[EXACT]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
            schedule=[[THIS_TURN_END]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[빅 맘 해적단]],
          },
        },
        costs={
          {
            count=1,
            mode=[[OPTIONAL]],
            op=[[TRASH_LIFE_TOP]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=true,
        source_text=[[【기동: 메인】【턴 1회】자신의 라이프 위에서 1장을 트래시에 놓을 수 있다: 자신의 리더가 《빅 맘 해적단》 특징을 가진 경우, 이번 턴 종료 시, 자신의 덱 위에서 1장을 라이프 맨 위에 더한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-101]],
    schema_version=1,
  })
end
