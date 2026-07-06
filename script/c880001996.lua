-- AUTO-GENERATED: ST27-002 / 카타리나 데본
-- rules_id=ST27-002 script_id=880001996 fingerprint=ba14e50beaab5b5da94656fb756cfb6c987c748c622df6a257b798b6c68c20c2
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST27-002]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            amount=-1,
            duration=[[THIS_TURN]],
            op=[[MODIFY_COST]],
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
            trait=[[검은 수염 해적단]],
          },
        },
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《검은 수염 해적단》 특징을 가진 경우, 이번 턴 동안, 상대의 캐릭터 1장까지의 코스트 -1.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            count=1,
            op=[[DRAW]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E2]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 1장 뽑는다.]],
        timings={
          [[ON_KO]],
        },
      },
    },
    keywords={},
    rules_id=[[ST27-002]],
    schema_version=1,
  })
end
