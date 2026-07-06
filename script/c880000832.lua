-- AUTO-GENERATED: OP06-098 / 스릴러 바크
-- rules_id=OP06-098 script_id=880000832 fingerprint=27a19b30486f6ceba49ab4559e355bbd12335531eed902d994727067a665e634
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP06-098]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=2,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[스릴러 바크 해적단]],
          },
        },
        costs={
          {
            count=1,
            op=[[REST_DON]],
          },
          {
            op=[[REST_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】1(코스트 에리어의 두웅!!을 지정된 수만큼 레스트할 수 있다), 이 스테이지를 레스트할 수 있다: 자신의 리더가 《스릴러 바크 해적단》 특징을 가진 경우, 자신의 트래시에서 코스트 2 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드를 1장까지 레스트 상태로 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP06-098]],
    schema_version=1,
  })
end
