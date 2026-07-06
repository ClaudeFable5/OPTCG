-- AUTO-GENERATED: OP09-089 / 스트롱거
-- rules_id=OP09-089 script_id=880001185 fingerprint=afacc75708bb4b13a6d83f38ea24ac494005520df5011a851035add66a0cc044
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP09-089]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            amount=-2,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
            selector={
              count=1,
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[검은 수염 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[TRASH_HAND]],
          },
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】자신의 패 1장을 버리고, 이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《검은 수염 해적단》 특징을 가진 경우, 카드를 1장 뽑는다. 그 후, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -2.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP09-089]],
    schema_version=1,
  })
end
